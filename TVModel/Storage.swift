//
//  Storage.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
import RxSwift

public class Storage: Storaging {
    
    private let diskStorage: DiskStoraging!
    
    private let cloudStorage: Networking!
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    public init(diskStorage: DiskStoraging, cloudStorage: Networking){
        self.diskStorage = diskStorage
        self.cloudStorage = cloudStorage
    }
    
    private enum Errors: ErrorType {
        case InvalidQueryLength
    }
    
    public func getUser(username:String) -> Observable<UserEntity>{
        /*return diskStorage.loadUser(username).catchError({ (error) -> Observable<UserEntity> in
            return self.downloadAndSaveUser(username)
        })*/
        return self.downloadAndSaveUser(username)
    }
    private func downloadAndSaveUser(username: String) -> Observable<UserEntity> {
        return downloadUser(username).map{
            user in
            self.saveUserEntity(user)
        }
    
    
        //return saveUserEntity(downloadUser(username))
    }
    
    
    private func saveUserEntity(user: UserEntity) -> UserEntity {
        let _ = user.parseToDBO()
        try! CoreDataStackManager.instance.managedObjectContext.save()
        return user
    }
    
    
    private func downloadUser(username:String) -> Observable<UserEntity> {
        return Observable.zip(cloudStorage.searchUser(username), downloadRepos(username), resultSelector: {
                user, repos in
                var userCopy = UserEntity(name: user.name, avatarUrl: user.avatarUrl)
                userCopy.repos = repos
                return userCopy
            })
    }

    private func downloadRepos(username:String) -> Observable<[RepositoryEntity]> {
        return downloadBuilds(fromObservableArrayToObservable(cloudStorage.requestRepositories(username))).toArray()
    }
    
    private func fromObservableArrayToObservable<T>(observable: Observable<[T]>) -> Observable<T> {
        return observable.flatMap { array in
            return array.toObservable()
        }
    }




    
    
    private func downloadBuilds(repoObservable: Observable<RepositoryEntity>) -> Observable<RepositoryEntity> {
        return repoObservable
            .flatMap { repo in
                return Observable.zip(
                    Observable.just(repo),
                    self.cloudStorage.requestBuilds(repo.slug),
                    resultSelector:{ (var repo, builds) in
                        repo.builds = builds
                        return repo
                })
            }
    }


}