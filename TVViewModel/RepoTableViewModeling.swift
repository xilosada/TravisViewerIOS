//
//  RepoTableViewModeling.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 11/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
import RxSwift

public protocol RepoTableViewModeling {
    func loadRepos(username: String) -> Observable<[RepoTableViewCellModeling]>
}