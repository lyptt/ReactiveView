import Foundation
import ReactiveView

enum SampleViewModelStateIdentifier {
  case initial
  case buttonTapped
}

struct SampleViewModelState {
  let identifier: SampleViewModelStateIdentifier
}

class SampleViewModel: ViewModel<SampleViewModelState> {
  init() {
    super.init(initialState: SampleViewModelState(identifier: .initial))
  }

  @objc func handleButtonTapped() {
    currentState = SampleViewModelState(identifier: .buttonTapped)
  }
}
