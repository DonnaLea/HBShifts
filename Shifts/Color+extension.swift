//
//  Color+extension.swift
//  Shifts
//
//  Created by Donna McCulloch on 8/6/18.
//  Copyright © 2018 Donna McCulloch. All rights reserved.
//

import UIKit

extension UIColor {

  convenience init(color: String) {
    switch color {
    case "red":
      self.init(red: 1, green: 0, blue: 0, alpha: 1)
    case "blue":
      // Navy.
      self.init(red: 0, green: 0, blue: 0.5, alpha: 1)
    case "green":
      // Forest green.
      self.init(red: 34/255, green: 139/255, blue: 34/255, alpha: 1)
    default: // White.
      self.init(red: 1, green: 1, blue: 1, alpha: 1)
    }
  }

}

