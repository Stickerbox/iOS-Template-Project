//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class AppCoordinator: RootViewCoordinator {
    
    var storyboard: UIStoryboard = UIStoryboard()
    
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    /// Window to manage
    let window: UIWindow
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()

    // MARK: - Init
    
    public init(window: UIWindow) {
        self.window = window
        
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
    }
    
    // MARK: - Functions
    
    /// Starts the coordinator
    public func start() {
        self.startInitialFlow()
    }
    
    /// Creates a new MainFlowCoordinator and places its rootViewController into the navigation controller
    private func startInitialFlow() {
        let initialFlowCoordinator = MainFlowCoordinator()
        initialFlowCoordinator.start()
        self.addChildCoordinator(initialFlowCoordinator)
        self.rootViewController.present(initialFlowCoordinator.rootViewController, animated: true, completion: nil)
    }
}
