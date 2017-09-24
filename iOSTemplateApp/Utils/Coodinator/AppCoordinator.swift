//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    var tabBarController: UITabBarController
    var tabs: [AnyTabCoordinator]

    // MARK: - Init
    
    public init(tabBarController: UITabBarController, tabs: [AnyTabCoordinator]) {
        self.tabBarController = tabBarController
        self.tabs = tabs
    }
    
    // MARK: - Functions
    
    /// Starts the coordinator
    public func start() {
        tabBarController.viewControllers = tabs.map { $0.rootController }
    }

}
