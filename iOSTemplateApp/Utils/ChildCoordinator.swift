//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import Foundation

// MARK: ChildCoordinator

protocol ChildCoordinator: class {
    associatedtype RootType: UIViewController
    var rootController: RootType { get }
    var storyboard: UIStoryboard { get }
}
