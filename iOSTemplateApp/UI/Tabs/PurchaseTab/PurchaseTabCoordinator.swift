//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class PurchaseTabCoordinator: RootTabCoordinator {
    
    let storyboard = UIStoryboard(.purchase)
    
    var rootController: UINavigationController
    
    var tabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
    
    init() {
        let selectViewController: SelectItemViewController = storyboard.inflateVC()
        selectViewController.viewModel = SelectItemViewModel()
        
        rootController = UINavigationController(rootViewController: selectViewController)
        rootController.tabBarItem = tabBarItem

    }
}

