//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import Foundation

protocol MainViewModelConformable {
    var users: Observable<[User]?> { get }
    var progressText: Observable<String> { get }
    
    func getUser()
    func getBadUsers()
}

class MainViewModel: MainViewModelConformable {
    
    let users = Observable<[User]?>(nil)
    let progressText = Observable<String>("Tap the button to start")
    
    func getUser() {
        progressText.value = "Getting users..."
        
        getUsers(from: User.allUserConfiguration)
    }
    
    func getBadUsers() {
        progressText.value = "Getting bad users..."

        getUsers(from: User.badUserConfiguration)
    }
    
    private func getUsers(from config: WebServiceConfiguration<[User]>) {
        
        URLSession.shared.request(for: config) { response in
            
            switch response {
                
            case let .success(users):
                self.progressText.value = "Request succeeded"
                self.users.value = users
                
            case .failure:
                self.progressText.value = "An error has occured"
            }
        }
    }
    
}
