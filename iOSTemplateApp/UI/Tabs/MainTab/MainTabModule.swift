//
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
