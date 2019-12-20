//
//  AppDelegate.swift
//  template-mvvmc-swiftui
//
//  Created by Fromage Charley on 09/06/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    internal var window: UIWindow?

    // TODO: Clean, I don't see the point of having a lazy var. The applicationCoordinator is only called to use its 'start()' method.
//    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
//
//    private func makeCoordinator() -> Coordinator {
//        return ApplicationCoordinator(router: RouterImp(with: self.window!), coordinatorFactory: CoordinatorFactoryImp())
//    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let window = window {
            let router = RouterImp(with: window)
            let coordinatorFactory = CoordinatorFactoryImp()

            let applicationCoordinator = ApplicationCoordinator(router: router, coordinatorFactory: coordinatorFactory)
            applicationCoordinator.start()
        }

        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
