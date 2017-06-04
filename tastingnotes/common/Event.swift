//
//  Event.swift
//  tastingnotes
//
//  Created by iellis on 4/6/17.
//  Copyright © 2017 IanEllis. All rights reserved.
//

import Foundation

private protocol Invocable: class {
    func invoke(_ data: Any)
}

public protocol DisposableEvent {
    func dispose()
}

public class Event<T> {
    
    public typealias EventHandler = (T) -> ()
    
    private var eventHandlers = [Invocable]()
    
    public func raise(data: T) {
        for handler in self.eventHandlers {
            handler.invoke(data)
        }
    }
    
    public func addHandler<U: AnyObject>(target: U,
                           handler: @escaping (U) -> EventHandler) -> DisposableEvent {
        let wrapper = EventHandlerWrapper(target: target,
                                          handler: handler, event: self)
        eventHandlers.append(wrapper)
        return wrapper
    }
    
    private class EventHandlerWrapper<R: AnyObject, U: Any>: Invocable, DisposableEvent {
        
        private weak var target: R?
        
        private let handler: (R) -> (U) -> ()
        private let event: Event<U>
        
        init(target: R?, handler: @escaping (R) -> (U) -> (), event: Event<U>) {
            self.target = target
            self.handler = handler
            self.event = event;
        }
        
        func invoke(_ data: Any) -> () {
            if let t = target {
                handler(t)(data as! U)
            }
        }
        
        func dispose() {
            event.eventHandlers =
                event.eventHandlers.filter { $0 !== self }
        }
    }
}





