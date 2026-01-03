//
//  ButtonAssembly.swift
//  Flip7Calculator
//
//  Created by Matthias Zarzecki on 03.01.26.
//

import SwiftUI

struct ButtonAssembly: View {
  private let viewModel: Flip7ViewModel
  private let color: Color
  private let cardTappedAction: (Flip7CardType) -> Void

  init(
    viewModel: Flip7ViewModel,
    color: Color,
    cardTappedAction: @escaping (Flip7CardType) -> Void
  ) {
    self.viewModel = viewModel
    self.color = color
    self.cardTappedAction = cardTappedAction
  }

  var body: some View {
    VStack {
      HStack {
        if viewModel.numberOfZeroes > 0 {
          ExtrudedButton(text: "0", color: color, action: { cardTappedAction(.zero) })
        }
        if viewModel.numberOfOnes > 0 {
          ExtrudedButton(text: "1", color: color, action: { cardTappedAction(.one) })
        }
        if viewModel.numberOfTwos > 0 {
          ExtrudedButton(text: "2", color: color, action: { cardTappedAction(.two) })
        }
        if viewModel.numberOfThrees > 0 {
          ExtrudedButton(text: "3", color: color, action: { cardTappedAction(.three) })
        }
        if viewModel.numberOfFours > 0 {
          ExtrudedButton(text: "4", color: color, action: { cardTappedAction(.four) })
        }
        if viewModel.numberOfFives > 0 {
          ExtrudedButton(text: "5", color: color, action: { cardTappedAction(.five) })
        }
        if viewModel.numberOfSixes > 0 {
          ExtrudedButton(text: "6", color: color, action: { cardTappedAction(.six) })
        }

      }
      HStack {
        if viewModel.numberOfSevens > 0 {
          ExtrudedButton(text: "7", color: color, action: { cardTappedAction(.seven) })
        }
        if viewModel.numberOfEights > 0 {
          ExtrudedButton(text: "8", color: color, action: { cardTappedAction(.eight) })
        }
        if viewModel.numberOfNines > 0 {
          ExtrudedButton(text: "9", color: color, action: { cardTappedAction(.nine) })
        }
        if viewModel.numberOfTens > 0 {
          ExtrudedButton(text: "10", color: color, action: { cardTappedAction(.ten) })
        }
        if viewModel.numberOfElevens > 0 {
          ExtrudedButton(text: "11", color: color, action: { cardTappedAction(.eleven) })
        }
        if viewModel.numberOfTwelves > 0 {
          ExtrudedButton(text: "12", color: color, action: { cardTappedAction(.twelve) })
        }
      }

      HStack {
        if viewModel.numberOfTimesTwos > 0 {
          ExtrudedButton(text: "x2", color: color, action: { cardTappedAction(.timesTwo) })
        }
        if viewModel.numberOfPlusTwos > 0 {
          ExtrudedButton(text: "+2", color: color, action: { cardTappedAction(.plusTwo) })
        }
        if viewModel.numberOfPlusFours > 0 {
          ExtrudedButton(text: "+4", color: color, action: { cardTappedAction(.plusFour) })
        }
        if viewModel.numberOfPlusSixes > 0 {
          ExtrudedButton(text: "+6", color: color, action: { cardTappedAction(.plusSix) })
        }
      }

      HStack {
        if viewModel.numberOfPlusEights > 0 {
          ExtrudedButton(text: "+8", color: color, action: { cardTappedAction(.plusEight) })
        }
        if viewModel.numberOfPlusTens > 0 {
          ExtrudedButton(text: "+10", color: color, action: { cardTappedAction(.plusTen) })
        }
      }
    }
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  ButtonAssembly(
    viewModel: Flip7ViewModel(),
    color: .green,
  ) { _ in }
  .padding()
}
