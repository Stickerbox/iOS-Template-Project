//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    var tabBarController: UITabBarController
    var tabs: [AnyTabCoordinator]
    var window: UIWindow?
    
    public init(window: UIWindow?) {
        self.tabBarController = UITabBarController()
        self.window = window
        
        window?.rootViewController = tabBarController
        
        let tabs = [MainTabCoordinator().deGenerisized,
                    PurchaseTabCoordinator().deGenerisized]
        
        self.tabs = tabs
    }
    
    public func start() {
        tabBarController.viewControllers = tabs.map { $0.rootController }
        window?.makeKeyAndVisible()
    }

}
