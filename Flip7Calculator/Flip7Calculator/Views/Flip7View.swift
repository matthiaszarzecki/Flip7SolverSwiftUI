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

struct Flip7View: View {
  @ObservedObject private var viewModel = Flip7ViewModel()

  var body: some View {
    VStack {
      Text("Flip7 Calculator")
        .padding(.bottom, 48)

      DuolingoButton(
        title: "Continue",
        backgroundColor: Color(red: 88/255, green: 204/255, blue: 2/255),
        shadowColor: Color(red: 70/255, green: 168/255, blue: 0/255)
      ) {
        print("Continue tapped")
      }

      Text("Cards Total: \(viewModel.numberOfAllCards)")
      Text("Cards Remaining: \(viewModel.numberOfCardsRemaining())")

      Text("Chance to Fail on Next Card: \(viewModel.chanceToFailOnNextCard())")
        .padding(.bottom, 48)

      VStack {
        Text("Others' Cards")
        HStack {
          if viewModel.numberOfZeroes > 0 {
            NumberButton(text: "0", action: { viewModel.otherCardReceived(cardType: .zero)})
          }
          if viewModel.numberOfOnes > 0 {
            NumberButton(text: "1", action: { viewModel.otherCardReceived(cardType: .one)})
          }
          if viewModel.numberOfTwos > 0 {
            NumberButton(text: "2", action: { viewModel.otherCardReceived(cardType: .two)})
          }
          if viewModel.numberOfThrees > 0 {
            NumberButton(text: "3", action: { viewModel.otherCardReceived(cardType: .three)})
          }
          if viewModel.numberOfFours > 0 {
            NumberButton(text: "4", action: { viewModel.otherCardReceived(cardType: .four)})
          }
          if viewModel.numberOfFives > 0 {
            NumberButton(text: "5", action: { viewModel.otherCardReceived(cardType: .five)})
          }
          if viewModel.numberOfSixes > 0 {
            NumberButton(text: "6", action: { viewModel.otherCardReceived(cardType: .six)})
          }

        }
        HStack {
          if viewModel.numberOfSevens > 0 {
            NumberButton(text: "7", action: { viewModel.otherCardReceived(cardType: .seven)})
          }
          if viewModel.numberOfEights > 0 {
            NumberButton(text: "8", action: { viewModel.otherCardReceived(cardType: .eight)})
          }
          if viewModel.numberOfNines > 0 {
            NumberButton(text: "9", action: { viewModel.otherCardReceived(cardType: .nine)})
          }
          if viewModel.numberOfTens > 0 {
            NumberButton(text: "10", action: { viewModel.otherCardReceived(cardType: .ten)})
          }
          if viewModel.numberOfElevens > 0 {
            NumberButton(text: "11", action: { viewModel.otherCardReceived(cardType: .eleven)})
          }
          if viewModel.numberOfTwelves > 0 {
            NumberButton(text: "12", action: { viewModel.otherCardReceived(cardType: .twelve)})
          }
        }

        HStack {
          if viewModel.numberOfFlipThrees > 0 {
            NumberButton(text: "Flip 3", action: { viewModel.otherCardReceived(cardType: .flipThree)})
          }
          if viewModel.numberOfSecondChances > 0 {
            NumberButton(text: "2nd Chance", action: { viewModel.otherCardReceived(cardType: .secondChance)})
          }
          if viewModel.numberOfFreezes > 0 {
            NumberButton(text: "Freeze", action: { viewModel.otherCardReceived(cardType: .freeze)})
          }
        }

        HStack {
          if viewModel.numberOfTimesTwos > 0 {
            NumberButton(text: "x2", action: { viewModel.otherCardReceived(cardType: .timesTwo)})
          }
          if viewModel.numberOfPlusTwos > 0 {
            NumberButton(text: "+2", action: { viewModel.otherCardReceived(cardType: .plusTwo)})
          }
          if viewModel.numberOfPlusFours > 0 {
            NumberButton(text: "+4", action: { viewModel.otherCardReceived(cardType: .plusFour)})
          }
          if viewModel.numberOfPlusSixes > 0 {
            NumberButton(text: "+6", action: { viewModel.otherCardReceived(cardType: .plusSix)})
          }
          if viewModel.numberOfPlusEights > 0 {
            NumberButton(text: "+8", action: { viewModel.otherCardReceived(cardType: .plusEight)})
          }
          if viewModel.numberOfPlusTens > 0 {
            NumberButton(text: "+10", action: { viewModel.otherCardReceived(cardType: .plusTen)})
          }
        }
      }
      .padding(.bottom, 48)

      VStack {
        Text("Your Cards:")
        Text(viewModel.myCurrentCardDisplay())

        HStack {
          if viewModel.numberOfZeroes > 0 {
            NumberButton(text: "0", action: { viewModel.myCardReceived(cardType: .zero )})
          }
          if viewModel.numberOfOnes > 0 {
            NumberButton(text: "1", action: { viewModel.myCardReceived(cardType: .one )})
          }
          if viewModel.numberOfTwos > 0 {
            NumberButton(text: "2", action: { viewModel.myCardReceived(cardType: .two )})
          }
          if viewModel.numberOfThrees > 0 {
            NumberButton(text: "3", action: { viewModel.myCardReceived(cardType: .three )})
          }
          if viewModel.numberOfFours > 0 {
            NumberButton(text: "4", action: { viewModel.myCardReceived(cardType: .four )})
          }
          if viewModel.numberOfFives > 0 {
            NumberButton(text: "5", action: { viewModel.myCardReceived(cardType: .five )})
          }
          if viewModel.numberOfSixes > 0 {
            NumberButton(text: "6", action: { viewModel.myCardReceived(cardType: .six )})
          }

        }
        HStack {
          if viewModel.numberOfSevens > 0 {
            NumberButton(text: "7", action: { viewModel.myCardReceived(cardType: .seven )})
          }
          if viewModel.numberOfEights > 0 {
            NumberButton(text: "8", action: { viewModel.myCardReceived(cardType: .eight )})
          }
          if viewModel.numberOfNines > 0 {
            NumberButton(text: "9", action: { viewModel.myCardReceived(cardType: .nine )})
          }
          if viewModel.numberOfTens > 0 {
            NumberButton(text: "10", action: { viewModel.myCardReceived(cardType: .ten )})
          }
          if viewModel.numberOfElevens > 0 {
            NumberButton(text: "11", action: { viewModel.myCardReceived(cardType: .eleven )})
          }
          if viewModel.numberOfTwelves > 0 {
            NumberButton(text: "12", action: { viewModel.myCardReceived(cardType: .twelve )})
          }
        }

        NumberButton(
          text: "End My Turn",
          action: viewModel.endTurn
        )
      }
    }
    .padding()
  }
}

#Preview {
  Flip7View()
}
