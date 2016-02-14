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
        searchField.rx_text.doOn(onNext:{ string in self.searchField.backgroundColor=UIColor.whiteColor(); self.reposButton.enabled=false}, onError: {error in return}, onCompleted: {})
            .throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribeNext{query in
                self.viewModel?.searchUser(query).observeOn(MainScheduler.instance).subscribe(
                    onNext: {
                        model in
                        print(model.username)
                        self.searchField.backgroundColor = model.result ? UIColor.greenColor(): UIColor.redColor()
                        self.reposButton.enabled = model.result
                        self.selectedUsername=model.username
                        return
                    }, onError: {error in
                        self.searchField.backgroundColor=UIColor.redColor()
                    },
                    onCompleted: {},
                    onDisposed: {}).addDisposableTo(self.disposeBag)
                }.addDisposableTo(disposeBag)
        reposButton.rx_tap.bindNext {
            self.performSegueWithIdentifier("showRepo", sender:self.selectedUsername)
        }.addDisposableTo(disposeBag)
    }

    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showRepo"){
            let buildTableVC = segue.destinationViewController as! RepoTableViewController
            let data = sender as! String
            buildTableVC.repoName = data
        }
    }
    
   /*
    public func checkUsername(username: String) {
    {
            viewModel?.searchUser(username)
    }*/
    
    @IBOutlet weak var searchField: UITextField!
    
    @IBOutlet weak var reposButton: UIButton!
    
    
}