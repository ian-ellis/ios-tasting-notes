//
//  AppDelegate.swift
//  tastingnotes
//
//  Created by iellis on 5/03/2017.
//  Copyright (c) 2017 IanEllis. All rights reserved.
//

import UIKit
import Cleanse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UINavigationControllerDelegate {

    var window: UIWindow?
//    var navigationController : UINavigationController?
    var rootViewController:UIViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let propertyInjector: PropertyInjector<AppDelegate>

        // Fake mode makes it easy to test and demo the app. It uses in process versions of the services

        propertyInjector = try! ComponentFactory.of(AppComponent.self, validate: false).build()
        // Now inject the properties into ourselves
        propertyInjector.injectProperties(into: self)
        // window should now be defined
        precondition(window != nil)
        window!.makeKeyAndVisible()
        
//        rootViewController = NotesViewController()
//        self.navigationController = UINavigationController()
//        if let navigationController = self.navigationController{
//            navigationController.delegate = self
//            navigationController.setNavigationBarHidden(true, animated: false)
//            if let rootViewController = self.rootViewController {
//                navigationController.pushViewController(rootViewController, animated: false)
//            }
//            
//        }
        return true
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.

    }


    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    }


    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }


    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
extension AppDelegate {


    func injectProperties(window: UIWindow, viewController:NotesViewController) {
        self.window = window
        self.rootViewController = viewController
    }

}

