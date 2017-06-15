////////////////////////////////////////////////////////////////////////////////
//
//  Freelancer
//  Copyright 2017 Freelancer
//  All Rights Reserved.
//
//  NOTICE: Prepared by Jasper Blues, on behalf of Freelancer
//
////////////////////////////////////////////////////////////////////////////////

import Foundation
import FieryCrucible
import UIKit

/**
* Factory for building top-level application components from constituent parts.
*/

public class ApplicationAssembly: DependencyFactory {

    public func mainWindow() -> UIWindow {
        return shared(
                factory: {
                    let instance = UIWindow(frame: UIScreen.main.bounds)
                    instance.backgroundColor = UIColor.white
                    return instance
                },
                configure: { instance in
                    instance.rootViewController = self.rootViewController()
                }
        )
    }

    func rootViewController() -> UIViewController {
        return shared(UINavigationController(rootViewController: listController()))
    }


    func listController() -> UIViewController {
        return scoped(ListingController(client: whatsBeefClient(), assembly: self))
    }

    func detailController(show: Show) -> UIViewController {
        return scoped(ProgramDetailController(show: show))
    }

}