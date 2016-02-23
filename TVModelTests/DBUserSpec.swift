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

public class DBUserSpec: QuickSpec {
    
    var storeCoordinator: NSPersistentStoreCoordinator!
    var managedObjectContext: NSManagedObjectContext!
    var managedObjectModel: NSManagedObjectModel!
    var store: NSPersistentStore!
    
    public override func spec (){
        describe("Disk storage implementation with Core Data") {
            var testContext : NSManagedObjectContext?
            beforeEach{
                testContext = self.getInMemoryContext()
            }
            it("Saves a build in DB") {
                let FAKE_USERNAME = "octocat"
                let FAKE_URL = "http://test.com"
                var user = UserEntity(name: FAKE_USERNAME, avatarUrl: FAKE_URL)
                var repo = RepositoryEntity(id: 1, slug: "slug", description: "description")
                let build = BuildEntity(number: "1",message: "a message", branch: "DBranch", status: .Passed)
                repo.builds = [build]
                user.repos = [repo]
                let dbUser = user.parseToDBO(testContext!)
                try! testContext?.save()
                expect(dbUser).notTo(beNil())
            }
        }
    }
    
    private func getUsers() ->[User]{
        let fetchRequest = NSFetchRequest(entityName: "User")
        let users = try! managedObjectContext.executeFetchRequest(fetchRequest) as! [User]
        return users
    }
    
    
    public func getInMemoryContext() -> NSManagedObjectContext {
        managedObjectModel = NSManagedObjectModel.mergedModelFromBundles([NSBundle(forClass: User.self)])
        storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        store = try! storeCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)
        managedObjectContext = NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = storeCoordinator
        return managedObjectContext
    }
    
}
