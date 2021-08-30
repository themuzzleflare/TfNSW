import Foundation
import UIKit

internal extension UIColor {
  static var train: UIColor {
    return UIColor(named: "train") ?? UIColor(red: 0.911, green: 0.505, blue: 0.172, alpha: 1.000)
  }

  static var metro: UIColor {
    return UIColor(named: "metro") ?? UIColor(red: 0.000, green: 0.542, blue: 0.544, alpha: 1.000)
  }

  static var accent: UIColor {
    return UIColor(named: "AccentColor") ?? UIColor(red: 0.925, green: 0.525, blue: 0.239, alpha: 1.000)
  }
}
