//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import Foundation

class BookmarksTabModule: Module, HasViewBookmarksViewModel {
    
    var viewBookmarksVM: ViewBookmarksViewModelConformable {
        return ViewBookmarksViewModel()
    }
}
