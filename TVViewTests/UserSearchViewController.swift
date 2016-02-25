//
//  UserSearchViewController.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 12/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import UIKit
import RxSwift
import TVViewModel

public class UserSearchViewController:  UIViewController {
    
    /// Stores last username fetched in a NSKeyedArchiver
    var selectedUsername: String?
    
    /// Where rx streams are disposed
    let disposeBag = DisposeBag()
    
    public var viewModel: UserSearchViewModeling?
    
    private weak var userField: UserTextField!
    
    @IBOutlet weak var searchField: UserTextField!
    
    @IBOutlet weak var reposButton: UIButton!
    
    @IBOutlet weak var numberOfReposLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    public override func viewDidLoad() {
        userField = UserTextField.toUserTextField(searchField)
        configureTextField()
        configureReposButton()
        setInitialUI()
    }
    
    /// Disposable to cancel the query
    var searchUserDisposable: Disposable?
    
    func configureTextField() {
        searchField.autocorrectionType = UITextAutocorrectionType.No
        /// Add instant search functionality to the TextField
        searchField.rx_text
            .throttle(0.3, scheduler: MainScheduler.instance)
            .filter{ !$0.isEmpty }
            .distinctUntilChanged()
            .doOn(onNext:{
                string in
                if let disposable = self.searchUserDisposable {
                    disposable.dispose()
                }
                self.searching()
            })
            .subscribeOn(Dependencies.sharedDependencies.backgroundWorkScheduler)
            .observeOn(Dependencies.sharedDependencies.mainScheduler)
            .subscribeNext{ self.getUser($0)}
            .addDisposableTo(disposeBag)
    }
    
    func configureReposButton() {
        /// Configure button to perform the segue using current selected username
        reposButton.rx_tap.bindNext {
            self.showRepoList(self.selectedUsername!)
            }
            .addDisposableTo(disposeBag)
    }
    
    func setInitialUI(){
        activityIndicator.hidden = true
        reposButton.enabled = false
        loadLastSearch()
    }
    
    func loadLastSearch() {
        /// Load the username fetched in the previous session
        if let username = KeyedStorage.loadString() {
            searchField.text = username
        }
    }

    func getUser(username:String) {
        if username.isEmpty {
            setResult(false)
            resetReposLabel()
        }
        /// Picks User from the Model Layer
        searchUserDisposable = self.viewModel!.searchUser(username)
            .subscribeOn(Dependencies.sharedDependencies.backgroundWorkScheduler)
            .observeOn(Dependencies.sharedDependencies.mainScheduler)
            .subscribe(
                onNext: { self.setModel($0) },
                onError: { self.renderError($0) },
                onCompleted: {},
                onDisposed: {})
        searchUserDisposable!.addDisposableTo(disposeBag)
    }
    
    
    private func showRepoList(username: String) {
        self.performSegueWithIdentifier("showRepo", sender: username)
    }
    
    private func setModel(model:UserSearchResultModeling){
        if model.username.lowercaseString == searchField.text?.lowercaseString {
            if model.numberOfRepos > 0 {
                reposButton.enabled = true
                numberOfReposLabel.textColor = model.result ? ColorPalette.primaryColor : UIColor.whiteColor()
            }
            selectedUsername = model.username
            numberOfReposLabel.text = "\(model.numberOfRepos) repos"
            KeyedStorage.saveString(model.username)
            setResult(model.result)
        } else {
            
        }
    }
    
    private func setErrorResult() {
        reposButton.enabled = false
        resetReposLabel()
        activityIndicator.hidden = true
        activityIndicator.stopAnimating()
    }
    
    private func resetReposLabel () {
        numberOfReposLabel.text = "0 repos"
    }
    
    private func setResult(result:Bool) {
        activityIndicator.hidden = true
        numberOfReposLabel.hidden = false
        userField.setResult(result)
    }
    
    private func searching(){
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        numberOfReposLabel.hidden = true
        reposButton.enabled=false
        userField.resetView()
        resetReposLabel()
    }
    
    func renderError(error:ErrorType) -> Void{
        if(error._domain == NSURLErrorDomain){
            NetworkAlert.showErrorAlert(self, onClosed: {})
            userField.text = ""
            userField.resetView()
        }else {
            setResult(false)
        }
        setErrorResult()
    }

    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showRepo"){
            let repoTableVC = segue.destinationViewController as! RepoTableViewController
            let data = sender as! String
            repoTableVC.repoName = data
        }
    }
}