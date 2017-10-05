//
//  BookmarksTabModule.swift
//  iOSTemplateApp
//
//  Created by Jordan.Dixon on 05/10/2017.
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import Foundation

class BookmarksTabModule: ViewBookmarksVMProvidable {
    
    var viewBookmarksVM: ViewBookmarksVMConformable {
        return ViewBookmarksViewModel()
    }
    
}
