import Foundation

infix operator <~

public func <~ (value1: EventListenerRegistry, value2: EventHandle) {
  value1.add(value2)
}

public class EventListenerRegistry {
  fileprivate var handles = Set<EventHandle>()
  fileprivate var emitter: EventEmitter?

  public init() {}

  public func attached(to emitter: EventEmitter?) -> EventListenerRegistry {
    self.emitter = emitter
    return self
  }

  public func add(_ handle: EventHandle) {
    handles.insert(handle)
  }

  deinit {
    handles.forEach { emitter?.removeListener($0) }
    handles = Set()
    emitter = nil
  }
}
