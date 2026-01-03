//
//  ButtonAssembly.swift
//  Flip7Calculator
//
//  Created by Matthias Zarzecki on 03.01.26.
//

import SwiftUI

struct ButtonAssembly: View {
  private let cardStates: CardStates
  private let color: Color
  private let cardTappedAction: (Flip7CardType) -> Void

  init(
    cardStates: CardStates,
    color: Color,
    cardTappedAction: @escaping (Flip7CardType) -> Void
  ) {
    self.cardStates = cardStates
    self.color = color
    self.cardTappedAction = cardTappedAction
  }

  var body: some View {
    VStack {
      HStack {
        if cardStates.numberOfZeroes > 0 {
          ExtrudedButton(text: "0", color: color, action: { cardTappedAction(.zero) })
        }
        if cardStates.numberOfOnes > 0 {
          ExtrudedButton(text: "1", color: color, action: { cardTappedAction(.one) })
        }
        if cardStates.numberOfTwos > 0 {
          ExtrudedButton(text: "2", color: color, action: { cardTappedAction(.two) })
        }
        if cardStates.numberOfThrees > 0 {
          ExtrudedButton(text: "3", color: color, action: { cardTappedAction(.three) })
        }
        if cardStates.numberOfFours > 0 {
          ExtrudedButton(text: "4", color: color, action: { cardTappedAction(.four) })
        }
        if cardStates.numberOfFives > 0 {
          ExtrudedButton(text: "5", color: color, action: { cardTappedAction(.five) })
        }
        if cardStates.numberOfSixes > 0 {
          ExtrudedButton(text: "6", color: color, action: { cardTappedAction(.six) })
        }

      }
      HStack {
        if cardStates.numberOfSevens > 0 {
          ExtrudedButton(text: "7", color: color, action: { cardTappedAction(.seven) })
        }
        if cardStates.numberOfEights > 0 {
          ExtrudedButton(text: "8", color: color, action: { cardTappedAction(.eight) })
        }
        if cardStates.numberOfNines > 0 {
          ExtrudedButton(text: "9", color: color, action: { cardTappedAction(.nine) })
        }
        if cardStates.numberOfTens > 0 {
          ExtrudedButton(text: "10", color: color, action: { cardTappedAction(.ten) })
        }
        if cardStates.numberOfElevens > 0 {
          ExtrudedButton(text: "11", color: color, action: { cardTappedAction(.eleven) })
        }
        if cardStates.numberOfTwelves > 0 {
          ExtrudedButton(text: "12", color: color, action: { cardTappedAction(.twelve) })
        }
      }

      HStack {
        if cardStates.numberOfTimesTwos > 0 {
          ExtrudedButton(text: "x2", color: color, action: { cardTappedAction(.timesTwo) })
        }
        if cardStates.numberOfPlusTwos > 0 {
          ExtrudedButton(text: "+2", color: color, action: { cardTappedAction(.plusTwo) })
        }
        if cardStates.numberOfPlusFours > 0 {
          ExtrudedButton(text: "+4", color: color, action: { cardTappedAction(.plusFour) })
        }
        if cardStates.numberOfPlusSixes > 0 {
          ExtrudedButton(text: "+6", color: color, action: { cardTappedAction(.plusSix) })
        }
      }

      HStack {
        if cardStates.numberOfPlusEights > 0 {
          ExtrudedButton(text: "+8", color: color, action: { cardTappedAction(.plusEight) })
        }
        if cardStates.numberOfPlusTens > 0 {
          ExtrudedButton(text: "+10", color: color, action: { cardTappedAction(.plusTen) })
        }
      }
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  ButtonAssembly(
    cardStates: CardStates(),
    color: .green,
  ) { _ in }
  .padding()
}
