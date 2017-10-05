//
//  SecondViewController.swift
//  iOSTemplateApp
//
//  Created by Jordan.Dixon on 24/09/2017.
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, Injectable {
    
    typealias Dependencies = HasSecondViewModel
    var dependencies: HasSecondViewModel!
    
    var finished: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        finished?()
    }
    
}
