import UIKit

import Swinject
import TVModel
import TVView
import TVViewModel

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let container = Container() { container in
        // Models
        container.register(Networking.self) { _ in Network(URLSession: NSURLSession.sharedSession())}
        
        container.register(DiskStoraging.self) { _ in DiskStorage(cdsManager:CoreDataStackManager.instance)}

        container.register(Storaging.self) { r in
            Storage(diskStorage: r.resolve(DiskStoraging.self)!, cloudStorage: r.resolve(Networking.self)!)
        }
        
        // View models
        container.register(BuildTableViewModeling.self) { r
            in BuildTableViewModel(storage: r.resolve(Storaging.self)!)
        }
        
        container.register(RepoTableViewModeling.self) { r
            in RepoTableViewModel(storage: r.resolve(Storaging.self)!)
        }
        
        container.register(UserSearchViewModeling.self){ r
            in UserSearchViewModel(storage: r.resolve(Storaging.self)!)
        }
        
        // Views
        container.registerForStoryboard(BuildTableViewController.self) {
            r, c in
            c.viewModel = r.resolve(BuildTableViewModeling.self)!
        }
        
        container.registerForStoryboard(RepoTableViewController.self) {
            r, c in
            c.viewModel = r.resolve(RepoTableViewModeling.self)!
        }
        
        container.registerForStoryboard(UserSearchViewController.self) {
            r, c in
            c.viewModel = r.resolve(UserSearchViewModeling.self)!
        }
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = UIColor.whiteColor()
        window.makeKeyAndVisible()
        self.window = window
        
        let bundle = NSBundle(forClass: BuildTableViewController.self)
        let storyboard = SwinjectStoryboard.create(name: "Main", bundle: bundle, container: container)
        window.rootViewController = storyboard.instantiateInitialViewController()
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        CoreDataStackManager.instance.saveContext()
    }
    
}