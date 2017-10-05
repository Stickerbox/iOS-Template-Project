//
//  BookmarksTabCoordinator.swift
//  iOSTemplateApp
//
//  Created by Jordan.Dixon on 05/10/2017.
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class BookmarksTabCoordinator: RootTabCoordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var storyboard = UIStoryboard(.bookmarks)
    
    var rootController: UINavigationController
    
    var tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
    
    let dependencies = BookmarksTabModule()
    
    init() {
        
        let vc: ViewBookmarksViewController = storyboard.inflateVC(with: dependencies)
        
        rootController = UINavigationController(rootViewController: vc)
        rootController.tabBarItem = tabBarItem
    }
}
