//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import Foundation

struct User: Codable {
    let firstName: String
    let lastName: String
    
    static var allUserConfiguration: WebServiceConfiguration<[User]> {
        let config = WebServiceConfiguration<[User]>(endpoint: "/bins/thjpl")
        return config
    }
    
    static var badUserConfiguration: WebServiceConfiguration<[User]> {
        let config = WebServiceConfiguration<[User]>(endpoint: "/bins/t71mh")
        return config
    }
}

