//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class AppCoordinator: RootViewCoordinator {
    
    var storyboard: UIStoryboard? = nil
    
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
        self.startMainFlow()
    }
    
    /// Creates a new MainFlowCoordinator and places its rootViewController into the navigation controller
    private func startMainFlow() {
        let mainFlowCoordinator = MainFlowCoordinator()
        mainFlowCoordinator.start()
        self.addChildCoordinator(mainFlowCoordinator)
        self.rootViewController.present(mainFlowCoordinator.rootViewController, animated: true, completion: nil)
    }
}
