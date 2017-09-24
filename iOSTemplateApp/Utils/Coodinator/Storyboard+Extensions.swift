//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case main = "Main"
}

enum StoryboardViewController: String {
    case mainViewController = "MainViewController"
}

extension UIStoryboard {
    
    convenience init(_ name: Storyboard) {
        self.init(name: name.rawValue, bundle: nil)
    }
    
    func instantiateViewController(withIdentifier identifier: StoryboardViewController) -> UIViewController? {
        return self.instantiateViewController(withIdentifier: identifier.rawValue)
    }
    
}
