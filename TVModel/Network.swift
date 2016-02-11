//
//  Network.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 09/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import RxCocoa
import RxSwift

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
            print(json)
            do {
                let entities = try BuildEntity.Mapper.parseJSONArray(json as! [AnyObject])
                return entities
            } catch {
                return []
            }
        }
    }
    
    public func requestRepositories(username: String) -> Observable<[RepositoryEntity]> {
        let urlContent = "https://api.travis-ci.org/repos/\(username)"
        let url = NSURL(string: urlContent)!
        return rx_JSON(url).map{
            json in
            do {
                let entities = try RepositoryEntity.Mapper.parseJSONArray(json as! [AnyObject])
                return entities
            } catch {
                return []
            }
        }
    }

}
