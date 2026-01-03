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
              color: .red,
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
              color: .green,
              cardTappedAction: viewModel.myCardReceived
            )

            // TODO: End My Turn button should have a different color
            ExtrudedButton(
              text: "End My Turn",
              color: .blue,
              action: viewModel.endTurn
            )
          }
        }
        .padding()
      }
    }
  }
}



#Preview {
  Flip7View()
}
