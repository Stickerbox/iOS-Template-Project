//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class MainTabCoordinator: TabCoordinator {
    
    let storyboard = UIStoryboard(.main)
    
    var rootController: UINavigationController
    var tabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
    
    init() {
        let main = storyboard.instantiateViewController(withIdentifier: .mainViewController) as! MainViewController
        main.viewModel = MainViewModel()
        
        rootController = UINavigationController(rootViewController: main)
        rootController.tabBarItem = tabBarItem
        
        main.finishedBlock = {
            self.showSecondViewController()
        }
    }
    
    func showSecondViewController() {
        guard let secondVC = storyboard.instantiateViewController(withIdentifier: .secondViewController) as? SecondViewController else { return }
        self.rootController.pushViewController(secondVC, animated: true)
    }
}
