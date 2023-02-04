//
//  NSParagraphStyle+Extension.swift
//  
//
//  Created by Paul Tavitian on 4/2/2023.
//

import Foundation
import UIKit

internal extension NSParagraphStyle {
  static let centreAligned: NSParagraphStyle = {
    let style = NSMutableParagraphStyle()
    style.alignment = .center
    style.firstLineHeadIndent = 5
    style.headIndent = 5
    style.tailIndent = 5
    return style
  }()
}
