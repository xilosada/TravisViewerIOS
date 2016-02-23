//
//  Storage.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
import Foundation
import RxSwift
import CoreData

public class DiskStorage: DiskStoraging {
    
    public enum StorageError: ErrorType {
        case NotFound
        case UnknownError
    }
    
    private let cdsManager: CoreDataStackManager!
    
    public init(cdsManager: CoreDataStackManager) {
        self.cdsManager = cdsManager
    }
    
    public func loadUser(name:String) -> Observable<UserEntity> {
        return loadDbUser(name).map{ $0.toEntity() }
    }
    
    private func loadDbUser(name:String) -> Observable<User> {
        return Observable.create { observer in
            do{
                let fetchRequest = NSFetchRequest(entityName: "User")
                if !name.isEmpty {
                    fetchRequest.predicate = NSPredicate(format: "name == %@", name)
                }
                
                let users = try self.cdsManager.managedObjectContext.executeFetchRequest(fetchRequest) as! [User]
                
                if let user = users.first {
                    observer.on(.Next(user))
                    observer.on(.Completed)
                    return NopDisposable.instance
                } else {
                    users.forEach{ self.cdsManager.managedObjectContext.deleteObject($0) }
                    observer.on(.Error(StorageError.NotFound))
                }
            } catch {
                observer.on(.Error(StorageError.UnknownError))
            }
            return  NopDisposable.instance
        }
    }
    
    public func loadRepo(id:Int) -> Observable<RepositoryEntity>{
        return Observable.create { observer in
            do{
                let fetchRequest = NSFetchRequest(entityName: "Repo")
                //fetchRequest.predicate = NSPredicate(format: "id == %ld", id)
                
                let repos = try self.cdsManager.managedObjectContext.executeFetchRequest(fetchRequest) as! [Repo]
                
                if let repo = repos.filter({ $0.id == id}).first {
                    observer.on(.Next(repo.toEntity()))
                    observer.on(.Completed)
                    return NopDisposable.instance
                } else {
                    observer.on(.Error(StorageError.NotFound))
                }
            } catch {
                observer.on(.Error(StorageError.UnknownError))
            }
            return  NopDisposable.instance
        }
    }
    
    public func saveUser(user:UserEntity) -> Observable<Bool> {
        return Observable.create { observer in
            let _ = user.parseToDBO(self.cdsManager.managedObjectContext)
            self.cdsManager.saveContext()
            observer.on(.Next(true))
            observer.on(.Completed)
            return NopDisposable.instance
        }
    }
    
    public func flushDb() -> Observable<Bool> {
        return loadDbUser("").map{ user in
            self.cdsManager.managedObjectContext.deleteObject(user)
            return true
        }
    }
    
}