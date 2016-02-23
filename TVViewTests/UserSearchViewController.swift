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
    
    public override func viewDidLoad() {
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
            .subscribeNext{ self.queryServer($0)}
            .addDisposableTo(disposeBag)
    }
    
    func queryServer(username:String) {
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
            searchField.text = ""
        }
        print(error)

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
    
    @IBOutlet weak var searchField: UITextField!
    
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
        searchField.backgroundColor = result ? ColorPalette.primary_lightColor: ColorPalette.accentColor
        searchField.layer.borderColor = result ? ColorPalette.primary_darkColor.CGColor: ColorPalette.iconsColor.CGColor
        searchField.layer.borderWidth = 2.0
    }
    
    private func searching(){
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        numberOfReposLabel.hidden = true
        searchField.backgroundColor=UIColor.whiteColor()
        reposButton.enabled=false
        searchField.layer.cornerRadius = 1.0
        searchField.layer.borderColor = UIColor.grayColor().CGColor
        resetReposLabel()
    }
    
    private func setBorder() {
        searchField.layer.cornerRadius = 8.0
        searchField.layer.masksToBounds = true
    }
    
    
}