//
// Created by iellis on 5/03/2017.
// Copyright (c) 2017 IanEllis. All rights reserved.
//

import Foundation

class ObservableField<T> {

    private var callbacks: Array<(T) -> Void> = []
    private var _value:T
    var value: T {
        get {
            return _value
        }
        set {
            _value = newValue
            notifyChange()
        }
    }

    init(_ value: T) {
        self._value = value
    }

    func onChange(_ callback: @escaping (T) -> Void) {
        callback(value)
        callbacks.append(callback)
    }

    func remove(callback: (T) -> Void) {
//        callbacks.index(of: callback)

    }

    func clear() {
        callbacks.removeAll()
    }

    private func notifyChange() {
        callbacks.forEach { callback in
            callback(value)
        }
    }


}
