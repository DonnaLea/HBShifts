//
//  Shift.swift
//  Shifts
//
//  Created by Donna McCulloch on 8/6/18.
//  Copyright © 2018 Donna McCulloch. All rights reserved.
//

import UIKit

struct Shift {

  /*
   "role": "Waiter",
   "name": "Anna",
   "start_date": "2018-04-20 9:00:00 -08:00",
   "end_date": "2018-4-20 12:00:00 -08:00",
   "color": "red"
   */

  let role: String
  let name: String
  let startDate: Date
  let endDate: Date
  let color: UIColor

}

// Note: There's a nice way with Swift 4 to use Codable and JSONDecoder to read in JSON files
extension Shift : Decodable {

  // MARK: - Coding Keys
  enum CodingKeys : String, CodingKey {
    case role
    case name
    case startDate = "start_date"
    case endDate = "end_date"
    case color
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    role = try container.decode(String.self, forKey: .role)
    name = try container.decode(String.self, forKey: .name)
    startDate = try container.decode(Date.self, forKey: .startDate)
    endDate = try container.decode(Date.self, forKey: .endDate)
    let colorString = try container.decode(String.self, forKey: .color)
    color = UIColor(color: colorString)
  }

}
