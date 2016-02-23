//
//  Dummy.swift
//  TravisViewerIOS
//
//  Created by X.I. Losada on 09/02/16.
//  Copyright © 2016 XiLosada. All rights reserved.
//

import Foundation

public class Dummy{
    
    public static let dummyUserJson: [String : AnyObject?] = [
        "login": "octocat",
        "id": 1,
        "avatar_url": "https://github.com/images/error/octocat_happy.gif",
        "gravatar_id": "",
        "url": "https://api.github.com/users/octocat",
        "html_url": "https://github.com/octocat",
        "followers_url": "https://api.github.com/users/octocat/followers",
        "following_url": "https://api.github.com/users/octocat/following[/other_user}",
        "gists_url": "https://api.github.com/users/octocat/gists[/gist_id}",
        "starred_url": "https://api.github.com/users/octocat/starred[/owner}[/repo}",
        "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
        "organizations_url": "https://api.github.com/users/octocat/orgs",
        "repos_url": "https://api.github.com/users/octocat/repos",
        "events_url": "https://api.github.com/users/octocat/events[/privacy}",
        "received_events_url": "https://api.github.com/users/octocat/received_events",
        "type": "User",
        "site_admin": false,
        "name": "monalisa octocat",
        "company": "GitHub",
        "blog": "https://github.com/blog",
        "location": "San Francisco",
        "email": "octocat@github.com",
        "hireable": false,
        "bio": "There once was...",
        "public_repos": 2,
        "public_gists": 1,
        "followers": 20,
        "following": 0,
        "created_at": "2008-01-14T04:33:35Z",
        "updated_at": "2008-01-14T04:33:35Z"
    ]
    
    public static let dummyRepositoriesJSON:[NSDictionary] =
    [
    [
    "id":7456701,
    "slug":"xilosada/TravisViewerIOS",
    "description":""
    ],
    [
    "id":6748325,
    "slug":"xilosada/BitcoinFinder",
    "description":"",
    "last_build_id":105598330,
    "last_build_number":"80",
    "last_build_status":0,
    "last_build_result":0,
    "last_build_duration":421,
    "last_build_started_at":"2016-01-29T04:19:29Z",
    "last_build_finished_at":"2016-01-29T04:26:30Z"
    ]
    ]
    
    public static let dummyBuildsJSON : [NSDictionary] =
    [
        [
            "id":102499790,
            "repository_id":7204801,
            "number":"15",
            "state":"finished",
            "result":0,
            "started_at":"2016-01-15T02:33:07Z",
            "finished_at":"2016-01-15T02:34:21Z",
            "duration":74,
            "commit":"9fdab6bcb756f563a8ad603634c65bcb48b868a2",
            "branch":"master",
            "message":"Merge pull request #2 from xilosada/development\n\nDevelopment",
            "event_type":"push"
        ],
        [
            "id":102499651,
            "repository_id":7204801,
            "number":"14",
            "state":"finished",
            "started_at":"2016-01-15T02:04:50Z",
            "finished_at":"2016-01-15T02:04:56Z",
            "duration":6,
            "commit":"803c481ac6c25464545d9a90db529c5d7b126630",
            "branch":"master",
            "message":"Removed coverage files from repo and added to gitignore",
            "event_type":"pull_request"
        ],
        [
            "id":102499018,
            "repository_id":7204801,
            "number":"13",
            "state":"finished",
            "result":0,
            "started_at":"2016-01-15T01:54:19Z",
            "finished_at":"2016-01-15T01:55:30Z",
            "duration":71,
            "commit":"268201fea51064046892f42da36236cdf9a2512d",
            "branch":"development",
            "message":"Removed coverage files from repo and added to gitignore",
            "event_type":"push"
        ],
        [
            "id":102497134,
            "repository_id":7204801,
            "number":"12",
            "state":"finished",
            "result":0,
            "started_at":"2016-01-15T01:41:13Z",
            "finished_at":"2016-01-15T01:42:24Z",
            "duration":71,
            "commit":"620c4b9b42f5a03527233288141683c741072b9b",
            "branch":"development",
            "message":"Merge branch 'bugfix_codecov_not_working' into development\nChanged travis-ci build tool to xcodebuild",
            "event_type":"push"
        ],
        [
            "id":102496493,
            "repository_id":7204801,
            "number":"11",
            "state":"finished",
            "result":0,
            "started_at":"2016-01-15T01:35:50Z",
            "finished_at":"2016-01-15T01:37:00Z",
            "duration":70,
            "commit":"0ae11f3c7ce03c701e12c9569825fcffa6d19267",
            "branch":"bugfix_codecov_not_working",
            "message":"Changed build tool to xcodebuild",
            "event_type":"push"
        ],
        [
            "id":102493106,
            "repository_id":7204801,
            "number":"10",
            "state":"finished",
            "result":0,
            "started_at":"2016-01-15T01:09:30Z",
            "finished_at":"2016-01-15T01:10:44Z",
            "duration":74,
            "commit":"f43148192972b16deff8fd2594275ad386ab7e2f",
            "branch":"bugfix_codecov_not_working",
            "message":"Change target scheme to SampleAppTests #3attemp",
            "event_type":"push"
        ],
        [
            "id":102492355,
            "repository_id":7204801,
            "number":"9",
            "state":"finished",
            "result":1,
            "started_at":"2016-01-15T01:03:58Z",
            "finished_at":"2016-01-15T01:04:08Z",
            "duration":10,
            "commit":"c9795c868159c988e63ecfc167a83b48c028afd5",
            "branch":"bugfix_codecov_not_working",
            "message":"Change target scheme to SampleAppTests #2attemp",
            "event_type":"push"
        ],
        [
            "id":102490915,
            "repository_id":7204801,
            "number":"8",
            "state":"finished",
            "result":1,
            "started_at":"2016-01-15T00:56:41Z",
            "finished_at":"2016-01-15T00:56:53Z",
            "duration":12,
            "commit":"d197500ac31270ebcdf5acc89387a606fe45384f",
            "branch":"bugfix_codecov_not_working",
            "message":"Change target scheme to SampleAppTests",
            "event_type":"push"
        ],
        [
            "id":102487873,
            "repository_id":7204801,
            "number":"7",
            "state":"finished",
            "result":0,
            "started_at":"2016-01-15T00:36:37Z",
            "finished_at":"2016-01-15T00:38:05Z",
            "duration":88,
            "commit":"4b572d2b459c4a74ac3816dfa204e97655cb5f61",
            "branch":"bugfix_codecov_not_working",
            "message":"Attemp#1 launching codecov script from the sourcecode folder",
            "event_type":"push"
        ],
        [
            "id":102484800,
            "repository_id":7204801,
            "number":"6",
            "state":"finished",
            "result":0,
            "started_at":"2016-01-15T00:17:10Z",
            "finished_at":"2016-01-15T00:18:53Z",
            "duration":103,
            "commit":"f5c0b12a15e72bc096fdc0742da94b9518ee8f43",
            "branch":"development",
            "message":"Merge branch 'feature_readme_with_build_results' into development\n\nUpdated README.md",
            "event_type":"push"
        ],
        [
            "id":102482675,
            "repository_id":7204801,
            "number":"5",
            "state":"finished",
            "result":0,
            "started_at":"2016-01-15T00:03:12Z",
            "finished_at":"2016-01-15T00:04:44Z",
            "duration":92,
            "commit":"d0f06cdf84d2303dab3474df0dddd058fbf14626",
            "branch":"development",
            "message":"Merge branch 'bug_travis_scheme_not_found' into development\nEdited .travis.yml including the osx_image",
            "event_type":"push"
        ],
        [
            "id":102481931,
            "repository_id":7204801,
            "number":"4",
            "state":"finished",
            "result":0,
            "started_at":"2016-01-14T23:58:38Z",
            "finished_at":"2016-01-15T00:00:00Z",
            "duration":82,
            "commit":"9de59c16f0361c5ad42f9a44b1b943b219ae2982",
            "branch":"master",
            "message":"added osx_image version",
            "event_type":"pull_request"
        ],
        [
            "id":102480721,
            "repository_id":7204801,
            "number":"3",
            "state":"finished",
            "result":0,
            "started_at":"2016-01-14T23:50:16Z",
            "finished_at":"2016-01-14T23:51:32Z",
            "duration":76,
            "commit":"3d9a95b671a0dc25a94fb5440f5e8bdb5fec7755",
            "branch":"bug_travis_scheme_not_found",
            "message":"added osx_image version",
            "event_type":"push"
        ],
        [
            "id":102479603,
            "repository_id":7204801,
            "number":"2",
            "state":"finished",
            "result":1,
            "started_at":"2016-01-14T23:42:59Z",
            "finished_at":"2016-01-14T23:43:26Z",
            "duration":27,
            "commit":"e976e9b977502fd2317dd98ed69af4d0f814d6cf",
            "branch":"bug_travis_scheme_not_found",
            "message":"shared app scheme",
            "event_type":"push"
        ],
        [
            "id":102478564,
            "repository_id":7204801,
            "number":"1",
            "state":"finished",
            "result":1,
            "started_at":"2016-01-14T23:35:05Z",
            "finished_at":"2016-01-14T23:35:12Z",
            "duration":7,
            "commit":"a2fc22b499f032cc12cb88a7c0c88b0fd2862f93",
            "branch":"development",
            "message":"Merge branch 'feature_travis_integration' into development\n\nAdded travis.yml",
            "event_type":"push"
        ]]
}