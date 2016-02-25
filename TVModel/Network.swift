//
//  Network.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 09/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import RxCocoa
import RxSwift

/// Networking implementation for retrieving data from the network.
public final class Network: Networking {
    
    private let urlSession: NSURLSession
    
    public init(URLSession:NSURLSession) {
        urlSession = URLSession
    }
    
    private func rx_JSON(URL: NSURL) -> Observable<AnyObject> {
        return urlSession.rx_JSON(URL)
    }
    
    public func requestBuilds(repositoryName: String) -> Observable<[BuildEntity]> {
        let urlContent = "https://api.travis-ci.org/repos/\(repositoryName)/builds"
        let url = NSURL(string: urlContent)!
        return rx_JSON(url).map{
            json in
            print("fetching \(repositoryName) builds from Travis API")
            do {
                let entities = try BuildEntity.Mapper.parseJSONArray(json as! [AnyObject])
                return entities
            } catch {
                return []
            }
        }
    }
    
    /// Returns an Observable from the repositories of Travis-CI API
    public func requestRepositories(username: String) -> Observable<[RepositoryEntity]> {
        
        let urlContent = "https://api.travis-ci.org/repos/\(username)"
        print("fetching \(urlContent)")
        guard let url = NSURL(string: urlContent) else {
            return Observable.empty()
        }
        return rx_JSON(url).map{
            json in
            do {
                guard let jsonObject = json as? [AnyObject] else {
                    print("json not valid: \(json)")
                    return []
                }
                let entities = try RepositoryEntity.Mapper.parseJSONArray(jsonObject)
                return entities
            } catch {
                print("mapper exception")
                return []
            }
        }
    }
    
    /// Returns an Observable with the user of Github
    public func searchUser(username: String) -> Observable<UserEntity> {
        let urlContent = "https://api.github.com/users/\(username)"
        let url = NSURL(string: urlContent.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())!)!
        return rx_JSON(url).map{
            json in
            print("fetching \(username) from Github API")
            return UserEntity(dictionary:json as! [String:AnyObject])!
        }
    }

}
