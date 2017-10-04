//
//  MainTabModule.swift
//  iOSTemplateApp
//
//  Created by Jordan.Dixon on 04/10/2017.
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class MainTabModule: HasMainViewModel, HasSecondViewModel {
    
    var mainViewModel: MainViewModelConformable {
        return MainViewModel()
    }
    
    var secondViewModel: SecondViewModelConformable {
        return SecondViewModel()
    }
    
}
