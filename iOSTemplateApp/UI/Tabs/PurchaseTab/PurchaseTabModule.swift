//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import Foundation

class PurchaseTabModule: Module, HasSelectItemViewModel {
    
    var selectItemViewModel: SelectItemViewModelConformable {
        return SelectItemViewModel()
    }
    
}
