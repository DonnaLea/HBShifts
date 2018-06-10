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
      self.init(red: 0, green: 0, blue: 1, alpha: 1)
    case "green":
      self.init(red: 0, green: 1, blue: 0, alpha: 1)
    default: //white
      self.init(red: 1, green: 1, blue: 1, alpha: 1)
    }

  }

}

