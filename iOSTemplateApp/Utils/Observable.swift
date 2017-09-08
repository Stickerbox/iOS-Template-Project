//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import Foundation

class Observable<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func observe(_ listener: Listener?) {
        self.listener = listener
    }
    
    func observeAndEmit(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
