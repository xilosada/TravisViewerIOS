//
//  Networking.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 09/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//



import RxSwift

///RestApi for retrieving data from the network.
public protocol Networking
{
    func requestRepositories(username: String) -> Observable<[RepositoryEntity]>
    func requestBuilds(repositoryName: String) -> Observable<[BuildEntity]>
    
    func searchUser(username: String) -> Observable<UserEntity>

}