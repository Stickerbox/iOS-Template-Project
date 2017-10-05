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
        
        let main: MainViewController = MainViewController.inflate(with: dependencies, from: storyboard)
        
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
        let secondVC: SecondViewController = SecondViewController.inflate(with: dependencies, from: storyboard)
        
        secondVC.finished = {
            self.showThird()
        }
        
        self.rootController.pushViewController(secondVC, animated: true)
    }
}

extension MainTabCoordinator {
    
    func showThird() {
        let thirdVC: ThirdViewController = ThirdViewController.inflate(with: dependencies, from: storyboard)
        self.rootController.show(thirdVC, sender: nil)
    }
}
