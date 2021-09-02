import Foundation
import SwiftDate

internal extension Int {
  /// Seconds to hours, minutes, seconds.
  var intervalString: String {
    return self.seconds.timeInterval.toString {
      $0.unitsStyle = .abbreviated
      $0.allowedUnits = [.hour, .minute, .second]
    }
  }
}
