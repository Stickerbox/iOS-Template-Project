//
//  Injectable.swift
//  iOSTemplateApp
//
//  Created by Jordan.Dixon on 04/10/2017.
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

protocol Injectable {
    associatedtype Dependencies
    var dependencies: Dependencies! { get set }
}
