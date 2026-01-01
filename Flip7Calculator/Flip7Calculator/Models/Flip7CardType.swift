//
//  Flip7CardType.swift
//  Flip7Calculator
//
//  Created by Matthias Zarzecki on 01.01.26.
//

enum Flip7CardType: Int, Comparable {
  static func < (lhs: Flip7CardType, rhs: Flip7CardType) -> Bool {
    lhs.rawValue < rhs.rawValue
  }

  case zero = 0
  case one = 1
  case two = 2
  case three = 3
  case four = 4
  case five = 5
  case six = 6
  case seven = 7
  case eight = 8
  case nine = 9
  case ten = 10
  case eleven = 11
  case twelve = 12

  case flipThree = 100
  case secondChance = 101
  case freeze = 102
  case timesTwo = 103
  case plusTwo = 104
  case plusFour = 105
  case plusSix = 106
  case plusEight = 107
  case plusTen = 108
}
