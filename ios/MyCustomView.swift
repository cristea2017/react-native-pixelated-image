
import UIKit

class MyCustomView: UIView {
  
  @objc var status = false {
    didSet {
      self.setupView()
    }
  }
  
  @objc var source = "" {
    didSet {
      self.setupView()
    }
  }

  @objc var onClick: RCTBubblingEventBlock?
  let img = UIImageView()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
   
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  private func setupView() {
      //  self.backgroundColor = self.status ? .green : .red
    self.isUserInteractionEnabled = true

    var localImg = "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAMAAACdt4HsAAAArlBMVEUAAAAAmpIFBAAKXA4NcxIRrbMTxMoawj0azD8a3EIa8EYf5kgjocgliKgtOTEwjoowj4kyIxFBYmBEUEhJS0pLWE9MTUxQXlRXZltec2Vnfm9ubm5yiHp5QjWNVKeRXkOUW6+ZY7GeaLegbbembsCoc8CpoaCpqamyemK1e2e4g2e9inC9i3HAkXnCFSDNtT7ZGCTa0lni5d7mECnpaU/r6+vs6u3z8/P4+Pj///+mxhuSAAAAAXRSTlMAQObYZgAAA2dJREFUWMPFVm1DozAMxt1LU71TT9353iHbFAfqecra/v8/dknaQlF2wPzgo6wbtE+epKFJkngsF3PEYhnGZCwW8xvEfBHG0QTzmxRxMw/jNgRKOQIeP4XgYy58OIhbb+PbhaOJGuk5onFhsCt18O5zZhgdzHr78ppg3HaGib88NhGE5xtd2LH5bJbbndEu1EHLr2ez63x8EKNtm8222UaCRagsVTXpcoFYLq1HuC8E2KJYrToIjMWQZY0qxtJqg9ANAchNBNpkGPN3BIbsmwEEptIqzTpcIAU9LrCTqLPSxoLwTjuC998tSkBIaEjROprA9UQgUK4k8D3DXyX5gbedGJSgtYXIrQTdrwlwtAJ1AlFICUA/pFUKbT5NnjXbQAKcZyIF7AMzmIp+AFH8/EHLgUWnRPD88sxeOoJKdynQToXlpXxZEm3S1IB4mjyt+blTULVygIKo+bK0o1a55YpdAp2lGgSxm5BZ+KAhWBu/Dz4OmpKKQqtSIngVNsuseOWANtpkKwZOLasgQSpVx9PpsSIee3IrjBG3J0AQNFfQJ0QuuLCzCpaHKXV+cXV1cY5vh7X7+/v+w2VlGJIou4B82kNIVKfSNDuenp6dnU5/ZykdKpm1mXOKto/SCocoD4Cc29tbI4xxElkSZ4EQ+HB3Fz8eGGVRFkVRlg8PNQFZjC+nUUBI60CGS/F/5VEWyXaA5GOIdu+TCPpcgIESZN9EGQ2ydcvZgH47OF86O7XNyQhPv3/9gysf26JfRuzjty+PAGFyED0ZFWxw13Cv++HPgzdxbpnsEwWbJwGHffvsanQBwDb5zefBO0meK5wH28uKyAbDn4yqObWEWK2KYvBLQ4dmXO6xMInWKdT3NmE5aDUcjqAYTqCxRsYtzxgXwJq4iFF5df1A6A/aAjqOqKbUc5Xico4ntGtVsPC+EQD/IdBcJ4kA12t9cHfQKiiH+NcdQLfeVW0MhutIdHV0d0Sxqc0e4V9nAGMF+D30A+vLw8sqVrBBQKKbKm0dS9OG6biobkKl/R6Yv2w59AOhP6jTW0YvSJzqtJzWhM4l9AOhP+g8HuK3hay70hw1BHVvY2zPMQiS+gTy1VV3kKEfCP1B52JsLaQvAwn1Cf43x668vy+pH3Aoyt4gUlcSX64foKYCO4uORvsfcK7/V9+NBb0AAAAASUVORK5CYII="

   if source != ""{
    localImg = source
   }
    let newImageData = Data(base64Encoded: localImg.replacingOccurrences(of: "data:image/png;base64,", with: ""))
  if let newImageData = newImageData {
   img.image = UIImage(data: newImageData)
  }
  
    img.layer.magnificationFilter = .nearest
     self.addSubview(img)
  }

  override func layoutSubviews() {
    img.frame = self.bounds
    
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let onClick = self.onClick else { return }
    
    let params: [String : Any] = ["value1":"react demo","value2":1]
    onClick(params)
  }
  
}
