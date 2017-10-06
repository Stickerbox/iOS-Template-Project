//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

// MARK: RootViewCoordinator

public protocol RootViewControllerProvider: class {
    // The coordinators 'rootViewController'. It helps to think of this as the view
    // controller that can be used to dismiss the coordinator from the view hierarchy.
    var rootViewController: UIViewController { get }
    var storyboard: UIStoryboard { get }
}

/// A Coordinator type that provides a root UIViewController
typealias ChildCoordinator = RootViewControllerProvider & DependencyProvidable
