//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

// MARK: Module

class Module {}

// MARK: RootTabCoordinator

protocol TabCoordinator {
    associatedtype RootType: UIViewController
    var rootController: RootType { get }
    var storyboard: UIStoryboard { get }
    var tabBarItem: UITabBarItem { get }
}

extension TabCoordinator {
    var deGenerisized: AnyTabCoordinator {
        return AnyTabCoordinator(self)
    }
}

protocol DependencyProvidable {
    associatedtype ProvidableType: Module
    var dependencies: ProvidableType { get }
}

typealias RootTabCoordinator = TabCoordinator & DependencyProvidable

class AnyTabCoordinator {
    var rootController: UIViewController
    var tabBarItem: UITabBarItem
    
    init<T: TabCoordinator>(_ tabCoordinator: T) {
        rootController = tabCoordinator.rootController
        tabBarItem = tabCoordinator.tabBarItem
    }
}
