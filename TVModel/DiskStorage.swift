//
//  Storage.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import RxSwift
import CoreData

public class DiskStorage: DiskStoraging {
    
    enum StorageError: ErrorType {
        case NotFound
        case UnknownError
    }
    
    private let cdsManager: CoreDataStackManager!
    
    public init(cdsManager: CoreDataStackManager) {
        self.cdsManager = cdsManager
    }
    
    public func loadUser(name:String) -> Observable<UserEntity> {
        return Observable.create { observer in
            do{
                let fetchRequest = NSFetchRequest(entityName: "User")
                fetchRequest.predicate = NSPredicate(format: "name == %@", name)

                let users = try self.cdsManager.managedObjectContext.executeFetchRequest(fetchRequest) as! [User]

                if let user = users.first{
                    let userEntity = UserEntity(name: user.name, avatarUrl:user.avatarUrl!)
                    observer.on(.Next(userEntity))
                    observer.on(.Completed)
                    return NopDisposable.instance
                }else {
                    observer.on(.Error(StorageError.NotFound))
                
                }
            } catch {
                observer.on(.Error(StorageError.UnknownError))
            }
            return  NopDisposable.instance
        }
    }
    
    
    public func saveUser(user:UserEntity) -> Observable<Bool> {
       let _ = User(name: user.name, avatarUrl: user.avatarUrl,context: cdsManager.managedObjectContext)
            return Observable.create { observer in
                self.cdsManager.saveContext()
                observer.on(.Next(true))
                observer.on(.Completed)
                return NopDisposable.instance
        }
    }
    
}