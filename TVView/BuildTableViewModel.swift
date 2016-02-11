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
        
    private let network: Networking
    
    public init(network: Networking) {
        self.network = network
    }
    
    public func loadBuilds(repoName: String) -> Observable<[BuildTableViewCellModeling]> {
        return network.requestBuilds(repoName).map{
            $0.flatMap{ BuildTableViewCellModel(build: $0) as BuildTableViewCellModeling}
        }
    }
}