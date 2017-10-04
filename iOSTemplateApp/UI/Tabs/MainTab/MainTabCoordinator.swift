//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class MainTabCoordinator: RootTabCoordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let storyboard = UIStoryboard(.main)
    
    var rootController: UINavigationController
    var tabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
    
    var dependencies = MainTabModule()
    
    init() {
        
        let main: MainViewController = storyboard.inflateVC()
        main.dependencies = dependencies
        
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
        secondVC.dependencies = dependencies
        self.rootController.pushViewController(secondVC, animated: true)
    }
}
