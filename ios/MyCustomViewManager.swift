
@objc (RCTMyCustomViewManager)
class MyCustomViewManager: RCTViewManager {

  override static func requiresMainQueueSetup() -> Bool {
    return true
  }

  override func view() -> UIView! {
    return MyCustomView()
  }

}
