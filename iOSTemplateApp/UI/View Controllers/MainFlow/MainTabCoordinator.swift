//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class MainTabCoordinator: TabCoordinator {
    
    let storyboard: UIStoryboard? = UIStoryboard(.main)
    
    var rootController: UINavigationController
    var tabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
    
    init() {
        let main = storyboard?.instantiateViewController(withIdentifier: .mainViewController) as! MainViewController
        main.viewModel = MainViewModel()
        
        rootController = UINavigationController(rootViewController: main)
        rootController.tabBarItem = tabBarItem
    }
}
