//
//  BookmarksTabCoordinator.swift
//  iOSTemplateApp
//
//  Created by Jordan.Dixon on 05/10/2017.
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class BookmarksTabCoordinator: RootTabCoordinator {
    
    var storyboard: UIStoryboard = UIStoryboard(.bookmarks)
    
    var rootController: UINavigationController
    
    var tabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
    
    var dependencies = BookmarksTabModule()
    
    init() {
        let vc: ViewBookmarksViewController = storyboard.inflateVC(with: dependencies)
        
        rootController = UINavigationController(rootViewController: vc)
        rootController.tabBarItem = tabBarItem
    }
    
}
