# ReactiveView

ReactiveView is a small library that allows you to simplify complex view controllers
via the MVVM pattern.

A ViewModel class is provided that emits events whenever its state changes. Subclasses
of ViewModel expose handlers for user interactions like button taps, which then updat
its state accordingly.

These state updates then get passed to your view controllers automatically along with
the previous state, allowing you to handle transitioning between states in your
view controller.

See the example in the Sample folder for further information.

