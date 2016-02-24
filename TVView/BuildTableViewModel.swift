//
//  BuildTableViewModel.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 09/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import TVModel
import RxSwift

public final class BuildTableViewModel: BuildTableViewModeling {
    
    private let storage: Storaging!
    
    public init(storage: Storaging) {
        self.storage = storage
    }
    
    public func getBuilds(repoId: Int) -> Observable<[BuildTableViewCellModeling]> {
        return storage.getBuilds(repoId).map{
            $0.flatMap{ BuildTableViewCellModel(build: $0) as BuildTableViewCellModeling }
            }
        }
    }
