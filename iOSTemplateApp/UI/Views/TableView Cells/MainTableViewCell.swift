//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let reuseID = "MainCell"
    
    @IBOutlet var firstName: UILabel!
    @IBOutlet var lastName: UILabel!
    
    func populate(from data: User?) {
        
        firstName.text = data?.firstName
        lastName.text = data?.lastName
    }
}
