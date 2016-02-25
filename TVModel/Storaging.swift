//
//  Storaging.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
import RxSwift

///Model layer protocol, encapsulates networking and persistance of entities
public protocol Storaging {
    func getUser(username:String) -> Observable<UserEntity>
    func getRepos(username:String) -> Observable<[RepositoryEntity]>
    func getBuilds(repoId:Int) -> Observable<[BuildEntity]>
}