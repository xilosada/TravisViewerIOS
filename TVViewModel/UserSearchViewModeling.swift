//
//  UserSearchViewModeling.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 12/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import RxSwift
import TVModel

public protocol UserSearchViewModeling {
    func searchUser(username: String) -> Observable<UserSearchResultModeling>
}