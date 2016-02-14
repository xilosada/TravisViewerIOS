//
//  Storaging.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
import RxSwift

public protocol Storaging {
    func getUser(username:String) -> Observable<UserEntity>
}