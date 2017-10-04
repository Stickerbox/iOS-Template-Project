//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

struct MainDependencies: HasMainViewModel {
    var viewModel: MainViewModelConformable
}

class MainTabCoordinator: RootTabCoordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let storyboard = UIStoryboard(.main)
    
    var rootController: UINavigationController
    var tabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
    
    var dependencies = MainDependencies(viewModel: MainViewModel())
    
    init() {
        
        let main = MainViewController.inject(with: dependencies)
//        let main: MainViewController = storyboard.inflateVC()
//        main.viewModel = MainViewModel()
        
        rootController = UINavigationController(rootViewController: main)
        rootController.tabBarItem = tabBarItem
        
        main.finishedBlock = {
            self.showSecondViewController()
        }
    }
}

// MARK: View Controller inflation extensions
extension MainTabCoordinator {
    
    func showSecondViewController() {
        let secondVC: SecondViewController = storyboard.inflateVC()
        self.rootController.pushViewController(secondVC, animated: true)
    }
}
