import UIKit
import ReactiveView
import Cartography

class ViewController: UIViewController {
  let registry = EventListenerRegistry()
  let vm = SampleViewModel()

  let label = UILabel()
  let button = UIButton(type: .system)

  override func loadView() {
    super.loadView()
    view.backgroundColor = .systemBackground

    [label, button].forEach {
      self.view.addSubview($0)
    }

    label.textAlignment = .center

    constrain(view, label, button) { container, label, button in
      label.top == container.safeAreaLayoutGuide.top + 50
      label.leading == container.safeAreaLayoutGuide.leading
      label.trailing == container.safeAreaLayoutGuide.trailing

      button.center == container.center
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    registry <~ vm.on("statechange") { [weak self] event in
      guard let current = event.data["current"] as? SampleViewModelState else { return }
      self?.handleTransition(from: event.data["previous"] as? SampleViewModelState, to: current)
    }

    navigationItem.title = "ReactiveView Sample"
    button.addTarget(vm, action: #selector(SampleViewModel.handleButtonTapped), for: .touchUpInside)
  }

  fileprivate func handleTransition(from: SampleViewModelState?, to: SampleViewModelState) {
    switch to.identifier {
    case .initial:
      label.text = "Hello world"
      button.setTitle("Tap me", for: .normal)
      break
    case .buttonTapped:
      label.text = "Button tapped"
      break
    }
  }
}
