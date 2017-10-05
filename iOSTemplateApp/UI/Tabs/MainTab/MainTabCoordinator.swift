//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class MainTabCoordinator: RootTabCoordinator {
    
    let storyboard = UIStoryboard(.main)
    
    var rootController: UINavigationController
    var tabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
    
    let dependencies = MainTabModule()
    
    init() {
        
        let main: MainViewController = storyboard.inflateVC(with: dependencies)
        
        rootController = UINavigationController(rootViewController: main)
        rootController.tabBarItem = tabBarItem
        
        main.finishedBlock = {
            self.showSecondViewController()
        }
    }
}

extension MainTabCoordinator {
    
    func showSecondViewController() {
        let secondVC: SecondViewController = storyboard.inflateVC(with: dependencies)
        
        secondVC.finished = {
            self.showThird()
        }
        
        self.rootController.pushViewController(secondVC, animated: true)
    }
}

extension MainTabCoordinator {
    
    func showThird() {
        let thirdVC: ThirdViewController = storyboard.inflateVC(with: dependencies)
        self.rootController.show(thirdVC, sender: nil)
    }
}
