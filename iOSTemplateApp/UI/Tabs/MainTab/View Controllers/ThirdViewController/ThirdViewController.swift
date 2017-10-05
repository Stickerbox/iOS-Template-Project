//
//  ThirdViewController.swift
//  iOSTemplateApp
//
//  Created by Jordan.Dixon on 05/10/2017.
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, Injectable {
    
    typealias Dependencies = HasThirdViewModel
    var dependencies: Dependencies!
    
    lazy var viewModel = dependencies.thirdViewModel
    
    override func viewDidLoad() {
        viewModel.text.observe { print($0) }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        viewModel.change()
    }
}
