////////////////////////////////////////////////////////////////////////////////
//
//  Freelancer
//  Copyright 2017 Freelancer
//  All Rights Reserved.
//
//  NOTICE: Prepared by Jasper Blues, on behalf of Freelancer
//
////////////////////////////////////////////////////////////////////////////////


import UIKit
import Hex

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let assembly = ApplicationAssembly()


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        setupGlobalAppearance()

        window = assembly.mainWindow()
        window!.makeKeyAndVisible()
        return true
    }


    private func setupGlobalAppearance() {
        UINavigationBar.appearance().titleTextAttributes = [
                NSForegroundColorAttributeName: UIColor.white
        ]
        UINavigationBar.appearance().barTintColor = UIColor(hex: "2494c5")
        UINavigationBar.appearance().tintColor = UIColor.white
    }


}

