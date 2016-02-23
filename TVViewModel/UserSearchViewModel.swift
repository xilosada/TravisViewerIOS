//
//  UserSearchViewModel.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 12/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import TVModel
import RxSwift

public final class UserSearchViewModel: UserSearchViewModeling {
    
    private let storage: Storaging!
    
    public init(storage: Storaging) {
        self.storage = storage
    }
    
    public func searchUser(username: String) -> Observable<UserSearchResultModeling> {
        return storage.getUser(username).map {
            UserSearchResultModel(user: $0)
        }
    }
    
}