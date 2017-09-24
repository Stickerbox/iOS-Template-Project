//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class MainFlowCoordinator: RootViewCoordinator {
    
    let storyboard: UIStoryboard? = UIStoryboard(.main)
    
    lazy var mainViewModel = MainViewModel()
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    func start() {
        guard let main = storyboard?.instantiateViewController(withIdentifier: .mainViewController) as? MainViewController else { return }
        main.viewModel = mainViewModel
        
        main.finishedBlock = { [weak self] in
            self?.presentSecondViewController()
        }
        
        self.navigationController.viewControllers = [main]
    }
    
    func presentSecondViewController() {
        guard let second = storyboard?.instantiateViewController(withIdentifier: .secondViewController) as? SecondViewController else { return }
        self.navigationController.pushViewController(second, animated: true)
    }
    
}
