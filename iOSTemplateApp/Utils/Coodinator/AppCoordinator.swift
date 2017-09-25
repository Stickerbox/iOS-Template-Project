//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    var tabBarController: UITabBarController
    var tabs: [AnyTabCoordinator]
    var window: UIWindow?
    
    // MARK: - Init
    
    public init(window: UIWindow?, tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        self.window = window
        
        window?.rootViewController = tabBarController
        
        let tabs = [MainTabCoordinator().deGenerisized,
                    PurchaseTabCoordinator().deGenerisized]
        
        self.tabs = tabs
    }
    
    // MARK: - Functions
    
    /// Starts the coordinator
    public func start() {
        tabBarController.viewControllers = tabs.map { $0.rootController }
        window?.makeKeyAndVisible()
    }

}
