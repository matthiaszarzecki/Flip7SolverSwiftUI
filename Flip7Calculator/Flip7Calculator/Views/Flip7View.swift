//
//  ContentView.swift
//  Flip7Calculator
//
//  Created by Matthias Zarzecki on 18.12.25.
//

import Combine
import SwiftUI

// TODO: New game button
// TODO: Use up second chance
// TODO: Wrap in scrollview for overflow
// TODO: Add readme

struct Flip7View: View {
  @ObservedObject private var viewModel = Flip7ViewModel()

  var body: some View {
    GeometryReader { geometry in
      ScrollView {

        Rectangle()
          .frame(width: geometry.size.width, height: 1)
          .foregroundStyle(Color.clear)

        VStack {
          // TODO: Bigger font, align left
          Text("Flip7 Calculator")
            .padding(.bottom, 48)

          Text("Cards Remaining: \(viewModel.numberOfCardsRemaining()) / \(viewModel.numberOfAllCards)")

          // TODO: MUCH BIGGER DISPLAY
          // TODO: constrain number string to 2 decimal places
          Text("Chance to Fail on Next Card: \(viewModel.chanceToFailOnNextCard())")
            .padding(.bottom, 48)

          VStack {
            Text("Others' Cards")

            ButtonAssembly(
              viewModel: viewModel,
              color: Color.red,
              cardTappedAction: viewModel.otherCardReceived
            )

            // TODO: Other Player Card buttons should have a different color
          }
          .padding(.bottom, 48)

          VStack {
            Text("Your Cards:")
            // TODO: Make card display nicer - use style similar to buttons, but flat
            Text(viewModel.myCurrentCardDisplay())

            ButtonAssembly(
              viewModel: viewModel,
              color: Color.green,
              cardTappedAction: viewModel.myCardReceived
            )

            // TODO: End My Turn button should have a different color
            ExtrudedButton(
              text: "End My Turn",
              color: Color.blue,
              action: viewModel.endTurn
            )
          }
        }
        .padding()
      }
    }
  }
}

struct ButtonAssembly: View {
  let viewModel: Flip7ViewModel
  let color: Color
  let cardTappedAction: (Flip7CardType) -> Void

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

#Preview {
  Flip7View()
}
