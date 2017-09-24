//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case main = "Main"
    case purchase = "Purchase"
}

enum MainStoryboardViewController: String {
    case mainViewController = "MainViewController"
    case secondViewController = "SecondViewController"
    case selectItemViewController = "SelectItemViewController"
}

extension UIStoryboard {
    
    convenience init(_ name: Storyboard) {
        self.init(name: name.rawValue, bundle: nil)
    }
    
    func instantiateViewController(withIdentifier identifier: MainStoryboardViewController) -> UIViewController? {
        return self.instantiateViewController(withIdentifier: identifier.rawValue)
    }
    
}
