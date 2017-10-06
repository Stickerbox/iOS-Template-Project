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
        
        main.finished = { self.showSecondViewController() }
    }
}

extension MainTabCoordinator {
    
    func showSecondViewController() {
        let secondVC: SecondViewController = storyboard.inflateVC(with: dependencies)
        
        secondVC.finished = { self.showThird(from: secondVC) }
        
        self.rootController.pushViewController(secondVC, animated: true)
    }
}

extension MainTabCoordinator {
    
    func showThird(from vc: UIViewController) {
        let thirdVC: ThirdViewController = storyboard.inflateVC(with: dependencies)
        vc.present(thirdVC, animated: true, completion: nil)
    }
}
