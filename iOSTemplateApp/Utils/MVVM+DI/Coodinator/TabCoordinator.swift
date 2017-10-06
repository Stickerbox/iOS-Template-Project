//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

// MARK: RootTabCoordinator

protocol TabCoordinator {
    associatedtype RootType: UIViewController
    var rootController: RootType { get }
    var tabBarItem: UITabBarItem { get }
    var storyboard: UIStoryboard { get }
}

extension TabCoordinator {
    var deGenerisized: AnyTabCoordinator {
        return AnyTabCoordinator(self)
    }
}

typealias RootTabCoordinator = TabCoordinator

class AnyTabCoordinator {
    var rootController: UIViewController
    var tabBarItem: UITabBarItem
    
    init<T: TabCoordinator>(_ tabCoordinator: T) {
        rootController = tabCoordinator.rootController
        tabBarItem = tabCoordinator.tabBarItem
    }
}
