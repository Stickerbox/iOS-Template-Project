//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

// MARK: ChildCoordinator

protocol ChildCoordinator: class {
    associatedtype RootType: UIViewController
    var rootController: RootType { get }
    var storyboard: UIStoryboard { get }
}
