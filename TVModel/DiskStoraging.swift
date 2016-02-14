//
//  Storaging.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import RxSwift

public protocol DiskStoraging {
    func loadUser(name:String) -> Observable<UserEntity>
    func saveUser(user:UserEntity) -> Observable<Bool>
}