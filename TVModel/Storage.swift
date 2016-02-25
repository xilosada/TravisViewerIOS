//
//  Storage.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 13/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//
import RxSwift

///Implementation of the Storaging protocol
public class Storage: Storaging {
    
    private let diskStorage: DiskStoraging!
    
    private let cloudStorage: Networking!
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    private var cachedUser: UserEntity?
    
    private enum Errors: ErrorType {
        case InvalidQueryLength
    }
    
    public init(diskStorage: DiskStoraging, cloudStorage: Networking){
        self.diskStorage = diskStorage
        self.cloudStorage = cloudStorage
    }
    
    public func getUser(username:String) -> Observable<UserEntity> {
        if let user = cachedUser {
            if user.name == username {
                return Observable.just(user)
            }
        }
        return getUserAfterFlush(username)
    }
    
    private func getUserAfterFlush(username:String) -> Observable<UserEntity>{
        diskStorage.flushDb().subscribe().dispose()
        return self.getUserInternal(username)
    }
    
    
    private func getUserInternal(username:String) -> Observable<UserEntity>{
        if username.isEmpty {
            return Observable.empty()
        }
        return diskStorage.loadUser(username).catchError{ (error) -> Observable<UserEntity> in
            self.downloadAndSaveUser(username)
        }
    }
    
    public func getRepos(username:String) -> Observable<[RepositoryEntity]>{
        return getUserInternal(username).map{
            $0.repos
        }
    }
    
    public func getBuilds(repoId:Int) -> Observable<[BuildEntity]>{
        return diskStorage.loadRepo(repoId).map{
            $0.builds
        }
    }
    
    private func downloadAndSaveUser(username: String) -> Observable<UserEntity> {
        return downloadUser(username).flatMap{ (user) -> Observable<UserEntity>  in
            self.cachedUser = user
            return self.saveUserEntity(user)
        }
    }
    
    private func downloadUser(username:String) -> Observable<UserEntity> {
        return Observable.zip(cloudStorage.searchUser(username), downloadRepos(username), resultSelector: {
                user, repos in
                var userCopy = UserEntity(name: user.name, avatarUrl: user.avatarUrl)
                userCopy.repos = repos
                return userCopy
            })
    }
    
    private func saveUserEntity(user: UserEntity) -> Observable<UserEntity> {
        return diskStorage.saveUser(user).map{ _ in user }
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