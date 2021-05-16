import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let win = UIWindow(frame: UIScreen.main.bounds)

    let vc = ViewController()
    let nav = UINavigationController(rootViewController: vc)
    win.rootViewController = nav

    win.makeKeyAndVisible()
    window = win
    return true
  }
}

