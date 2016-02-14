//
//  DiskStorageSpec.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 14/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import CoreData
import Nimble
import Quick
@testable import TVModel

public class DiskStorageSpec: QuickSpec {
    
    var storeCoordinator: NSPersistentStoreCoordinator!
    var managedObjectContext: NSManagedObjectContext!
    var managedObjectModel: NSManagedObjectModel!
    var store: NSPersistentStore!
    
    public override func spec (){
        describe("Disk storage implementation with Core Data") {
            it("Saves a build in DB") {
                self.setUpManagedObjectContext()
                let _ = Build(number: "2", message: "men", branch: "branch", context:self.managedObjectContext)
                try! self.managedObjectContext.save()
                let builds = self.getBuilds()
                let build = builds.first!
                expect(builds).notTo(beNil())
                expect(build.number).to(equal("2"))
            }
        }
    }
    
    private func getBuilds() ->[Build]{
        let fetchRequest = NSFetchRequest(entityName: "Build")
        let users = try! managedObjectContext.executeFetchRequest(fetchRequest) as! [Build]
        return users
    }
    
    
    public func setUpManagedObjectContext(){
        managedObjectModel = NSManagedObjectModel.inmergedModelFromBundles(NSBundle(forClass: DiskStorage.self))
        storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        store = try! storeCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)
        managedObjectContext = NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = storeCoordinator
    }
    
}
