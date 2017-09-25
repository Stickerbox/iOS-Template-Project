//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class MainTabCoordinator: RootTabCoordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let storyboard = UIStoryboard(.main)
    
    var rootController: UINavigationController
    var tabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
    
    init() {
        let main: MainViewController = storyboard.instantiate()
        main.viewModel = MainViewModel()
        
        rootController = UINavigationController(rootViewController: main)
        rootController.tabBarItem = tabBarItem
        
        main.finishedBlock = {
            self.showSecondViewController()
        }
    }
    
    func showSecondViewController() {
        let secondVC: SecondViewController = storyboard.instantiate()
        self.rootController.pushViewController(secondVC, animated: true)
    }
}
