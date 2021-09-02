import Foundation
import SwiftDate

internal extension Int {
  var secondsToHoursMinutesSeconds: String {
    return self.seconds.timeInterval.toString() {
      $0.unitsStyle = .abbreviated
    }
  }
}
