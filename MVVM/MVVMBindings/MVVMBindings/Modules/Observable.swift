//
//  Observable.swift
//  MVVMBindings
//
//  Created by Андрей on 02.03.2023.
//

import Foundation

class Observable<T> {
    typealias Listener = (T?) -> Void
    
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    private var listener: Listener?
    
    func bind(_ listener: @escaping Listener) {
        listener(value)
        self.listener = listener
    }
    
}
