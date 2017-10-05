//
//  ThirdViewModel.swift
//  iOSTemplateApp
//
//  Created by Jordan.Dixon on 05/10/2017.
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import Foundation

protocol HasThirdViewModel {
    var thirdViewModel: ThirdViewModelConformable { get }
}

protocol ThirdViewModelConformable {
    var text: Observable<String> { get }
    func change()
}

class ThirdViewModel: ThirdViewModelConformable {
    
    var text = Observable<String>("This is original")

    func change() {
        text.value = "Now it's different"
    }
    
}
