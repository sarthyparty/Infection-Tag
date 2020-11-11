//
//  AppDelegate.swift
//  Infection Tag
//
//  Created by 64000774 on 10/14/20.
//

import UIKit
import Amplify
import AmplifyPlugins

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let models = AmplifyModels()
        let apiPlugin = AWSAPIPlugin(modelRegistration: models)
        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: models)
        do {
            try Amplify.add(plugin: apiPlugin)
            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.configure()
            print("Initialized Amplify");
        } catch {
            print("Could not initialize Amplify: \(error)")
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    func applicationWillTerminate(_ application: UIApplication) {
//        print("HI")
//        print(myID)
//        Amplify.API.query(request: .get(PlayerPos.self, byId: "1DF45C82-BC18-41CC-BD9B-BFD0EB282C3C")) { event in
//            switch event {
//            case .success(let result):
//                print("hello?")
//                switch result {
//
//                case .success(let player):
//                    guard let player = player else {
//                        print("Could not find player")
//                        return
//                    }
//                    print("Successfully retrieved player: \(player)")
//                    Amplify.API.mutate(request: .delete(player)) { event in
//                        switch event {
//                        case .success(let result):
//                            switch result {
//                            case .success(let player):
//                                print("Successfully deleted player: \(player)")
//                            case .failure(let error):
//                                print("Got failed result with \(error.errorDescription)")
//                            }
//                        case .failure(let error):
//                            print("Got failed event with error \(error)")
//                        }
//                    }
//                case .failure(let error):
//                    print("Got failed result with \(error.errorDescription)")
//                }
//            default:
//                print("Got failed event with error")
//
//            }
//        }
        Amplify.DataStore.query(PlayerPos.self, byId: myID) {
            switch $0 {
            case .success(let result):
                // result will be a single object of type Post?
                print("Players: \(String(describing: result))")
                let player = result
                Amplify.DataStore.delete(player!) {
                    switch $0 {
                    case .success:
                        print("Player deleted!")
                    case .failure(let error):
                        print("Error deleting player - \(error.localizedDescription)")
                    }
                }
            case .failure(let error):
                print("Error on query() for type PlayerPos - \(error.localizedDescription)")
            }
        }
        
    }


}

