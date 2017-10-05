//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class SelectItemViewController: UIViewController, Injectable {
    
    typealias Dependencies = HasSelectItemViewModel
    var dependencies: Dependencies!
    
    lazy var viewModel = dependencies.selectItemViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
