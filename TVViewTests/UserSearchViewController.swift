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
    
    var selectedUsername: String?
    
    let disposeBag = DisposeBag()
    
    public var viewModel: UserSearchViewModeling?
    
    private weak var userField: UserTextField!
    
    public override func viewDidLoad() {
        userField = UserTextField.toUserTextField(searchField)
        configureEditText()
        configureReposButton()
        setInitialUI()
    }
    
    func setInitialUI(){
        activityIndicator.hidden = true
        reposButton.enabled = false
        loadLastSearch()
    }
    
    func loadLastSearch() {
        if let username = KeyedStorage.loadString() {
            searchField.text = username
        }
    }
    
    func configureEditText() {
        searchField.autocorrectionType = UITextAutocorrectionType.No
        searchField.rx_text
            .throttle(0.3, scheduler: MainScheduler.instance)
            .filter{ !$0.isEmpty }
            .distinctUntilChanged()
            .doOn(onNext:{
                string in
                self.searching()
            })
            .subscribeOn(Dependencies.sharedDependencies.backgroundWorkScheduler)
            .observeOn(Dependencies.sharedDependencies.mainScheduler)
            .subscribeNext{ self.getUser($0)}
            .addDisposableTo(disposeBag)
    }
    
    func getUser(username:String) {
        self.viewModel!.searchUser(username)
            .subscribeOn(Dependencies.sharedDependencies.backgroundWorkScheduler)
            .observeOn(Dependencies.sharedDependencies.mainScheduler)
            .subscribe(
                onNext: { self.setModel($0) },
                onError: { self.renderError($0) },
                onCompleted: {},
                onDisposed: {})
            .addDisposableTo(disposeBag)
    }
    
    func renderError(error:ErrorType) -> Void{
        if(error._domain == NSURLErrorDomain){
            NetworkAlert.showErrorAlert(self, onClosed: configureEditText)
            userField.resetView()
        }
        setErrorResult()
    }

    func configureReposButton() {
        reposButton.rx_tap.bindNext {
            self.showRepoList(self.selectedUsername!)
            }
            .addDisposableTo(disposeBag)
    }

    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showRepo"){
            let repoTableVC = segue.destinationViewController as! RepoTableViewController
            let data = sender as! String
            repoTableVC.repoName = data
        }
    }
    
    @IBOutlet weak var searchField: UserTextField!
    
    @IBOutlet weak var reposButton: UIButton!
    
    @IBOutlet weak var numberOfReposLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private func showRepoList(username: String) {
        self.performSegueWithIdentifier("showRepo", sender: username)
    }
    
    private func setModel(model:UserSearchResultModeling){
        if model.numberOfRepos > 0 {
            reposButton.enabled = true
            numberOfReposLabel.textColor = model.result ? ColorPalette.primaryColor : UIColor.whiteColor()
        }
        selectedUsername = model.username
        numberOfReposLabel.text = "\(model.numberOfRepos) repos"
        KeyedStorage.saveString(model.username)
        setResult(model.result)
    }
    
    private func setErrorResult() {
        reposButton.enabled = false
        resetReposLabel()
        setResult(false)
    }

    private func resetReposLabel () {
        numberOfReposLabel.text = "0 repos"
    }
    
    private func setResult(result:Bool) {
        activityIndicator.hidden = true
        activityIndicator.stopAnimating()
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
    
    
}