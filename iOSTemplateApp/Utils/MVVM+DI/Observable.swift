//
//  Copyright © 2017 Mubaloo. All rights reserved.
//

import Foundation

class Observable<T> {
    
    typealias Observer = (T) -> Void
    typealias Reactor = () -> Void
    var observer: Observer?
    var reactor: Reactor?
    
    func observe(_ observer: Observer?) {
        self.observer = observer
        observer?(value)
    }
    
    func observe(_ reactor: Reactor?) {
        self.reactor = reactor
        reactor?()
    }
    
    var value: T {
        didSet {
            observer?(value)
            reactor?()
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
