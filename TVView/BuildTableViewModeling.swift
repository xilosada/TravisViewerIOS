//
//  BuildTableViewModeling.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 09/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import TVModel
import RxSwift

public protocol BuildTableViewModeling {
    func getBuilds(repoId: Int) -> Observable<[BuildTableViewCellModeling]>
}
