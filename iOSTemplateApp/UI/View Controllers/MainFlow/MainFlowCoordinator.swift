//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class MainFlowCoordinator: RootViewCoordinator {
    
    let storyboard: UIStoryboard = UIStoryboard(.main)
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    func start() {
        let main: MainViewController = storyboard.instantiate()
        main.viewModel = MainViewModel()
        
        main.finishedBlock = { [weak self] in
            self?.presentSecondViewController()
        }
        
        self.navigationController.viewControllers = [main]
    }
    
    func presentSecondViewController() {
        let second: SecondViewController = storyboard.instantiate()
        self.navigationController.pushViewController(second, animated: true)
    }
    
}
