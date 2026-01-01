//
//  Double-Extension.swift
//  Flip7Calculator
//
//  Created by Matthias Zarzecki on 01.01.26.
//

import Foundation

extension Double {
  func round(to places: Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return (self * divisor).rounded() / divisor
  }

  func asPercentage() -> String {
    "\(self.round(to: 2) * 100)%"
  }
}
