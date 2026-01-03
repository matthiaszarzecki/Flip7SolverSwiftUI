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
          Text("Flip7 Calculator")
            .padding(.bottom, 48)

          Text("Cards Total: \(viewModel.numberOfAllCards)")
          Text("Cards Remaining: \(viewModel.numberOfCardsRemaining())")

          Text("Chance to Fail on Next Card: \(viewModel.chanceToFailOnNextCard())")
            .padding(.bottom, 48)

          VStack {
            Text("Others' Cards")

            ButtonAssembly(
              viewModel: viewModel,
              cardTappedAction: viewModel.otherCardReceived
            )

            // TODO: Other Player Card buttons should have a different color
          }
          .padding(.bottom, 48)

          VStack {
            Text("Your Cards:")
            Text(viewModel.myCurrentCardDisplay())

            ButtonAssembly(
              viewModel: viewModel,
              cardTappedAction: viewModel.myCardReceived
            )

            // TODO: End My Turn button should have a different color
            ExtrudedButton(
              text: "End My Turn",
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
  var viewModel = Flip7ViewModel()
  var cardTappedAction: (Flip7CardType) -> Void

  var body: some View {

    VStack {
      HStack {
        if viewModel.numberOfZeroes > 0 {
          ExtrudedButton(text: "0", action: { cardTappedAction(.zero) })
        }
        if viewModel.numberOfOnes > 0 {
          ExtrudedButton(text: "1", action: { cardTappedAction(.one) })
        }
        if viewModel.numberOfTwos > 0 {
          ExtrudedButton(text: "2", action: { cardTappedAction(.two) })
        }
        if viewModel.numberOfThrees > 0 {
          ExtrudedButton(text: "3", action: { cardTappedAction(.three) })
        }
        if viewModel.numberOfFours > 0 {
          ExtrudedButton(text: "4", action: { cardTappedAction(.four) })
        }
        if viewModel.numberOfFives > 0 {
          ExtrudedButton(text: "5", action: { cardTappedAction(.five) })
        }
        if viewModel.numberOfSixes > 0 {
          ExtrudedButton(text: "6", action: { cardTappedAction(.six) })
        }

      }
      HStack {
        if viewModel.numberOfSevens > 0 {
          ExtrudedButton(text: "7", action: { cardTappedAction(.seven) })
        }
        if viewModel.numberOfEights > 0 {
          ExtrudedButton(text: "8", action: { cardTappedAction(.eight) })
        }
        if viewModel.numberOfNines > 0 {
          ExtrudedButton(text: "9", action: { cardTappedAction(.nine) })
        }
        if viewModel.numberOfTens > 0 {
          ExtrudedButton(text: "10", action: { cardTappedAction(.ten) })
        }
        if viewModel.numberOfElevens > 0 {
          ExtrudedButton(text: "11", action: { cardTappedAction(.eleven) })
        }
        if viewModel.numberOfTwelves > 0 {
          ExtrudedButton(text: "12", action: { cardTappedAction(.twelve) })
        }
      }

      HStack {
        if viewModel.numberOfTimesTwos > 0 {
          ExtrudedButton(text: "x2", action: { cardTappedAction(.timesTwo) })
        }
        if viewModel.numberOfPlusTwos > 0 {
          ExtrudedButton(text: "+2", action: { cardTappedAction(.plusTwo) })
        }
        if viewModel.numberOfPlusFours > 0 {
          ExtrudedButton(text: "+4", action: { cardTappedAction(.plusFour) })
        }
        if viewModel.numberOfPlusSixes > 0 {
          ExtrudedButton(text: "+6", action: { cardTappedAction(.plusSix) })
        }
      }

      HStack {
        if viewModel.numberOfPlusEights > 0 {
          ExtrudedButton(text: "+8", action: { cardTappedAction(.plusEight) })
        }
        if viewModel.numberOfPlusTens > 0 {
          ExtrudedButton(text: "+10", action: { cardTappedAction(.plusTen) })
        }
      }
    }
  }
}

#Preview {
  Flip7View()
}
