//
//  Dependencies.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 23/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Foundation
import RxSwift

class Dependencies {
    
    static let sharedDependencies = Dependencies() // Singleton
    
    let URLSession = NSURLSession.sharedSession()
    let backgroundWorkScheduler: ImmediateSchedulerType
    let mainScheduler: SerialDispatchQueueScheduler
    
    private init() {
        let operationQueue = NSOperationQueue()
        operationQueue.maxConcurrentOperationCount = 2
        operationQueue.qualityOfService = NSQualityOfService.UserInitiated
        backgroundWorkScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        
        mainScheduler = MainScheduler.instance
    }
}