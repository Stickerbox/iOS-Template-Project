//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

// MARK: ChildCoordinator

protocol ChildCoordinatorProvider: class {
    associatedtype RootType: UIViewController
    var rootController: RootType { get }
    var storyboard: UIStoryboard { get }
}

typealias ChildCoordinator = ChildCoordinatorProvider & DependencyProvidable
