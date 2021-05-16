import Foundation

struct ViewModelStateTransition<T> {
  let oldState: T
  let newState: T
}

open class ViewModel<T>: EventEmitter {
  fileprivate var previousState: T?
  public var currentState: T! {
    willSet {
      previousState = currentState
    }

    didSet {
      emit("statechange", sticky: true, data: [
        "previous": previousState,
        "current": currentState
      ])
    }
  }

  private override init() {
    super.init()
  }

  public init(initialState: T) {
    super.init()
    currentState = initialState
    previousState = currentState

    emit("statechange", sticky: true, data: [
      "previous": previousState,
      "current": currentState
    ])
  }
}
