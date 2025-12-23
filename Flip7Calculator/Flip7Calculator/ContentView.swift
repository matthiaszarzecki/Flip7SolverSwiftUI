//
//  ContentView.swift
//  Flip7Calculator
//
//  Created by Matthias Zarzecki on 18.12.25.
//

import SwiftUI
import Combine

// TODO: Move to files
// TODO: Github repo
// TODO: New game button
// TODO: Use up second chance?
// TODO: public repo

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

class ViewModel: ObservableObject {
  @Published var numberOfZeroes = 1
  @Published var numberOfOnes = 1
  @Published var numberOfTwos = 2
  @Published var numberOfThrees = 3
  @Published var numberOfFours = 4
  @Published var numberOfFives = 5
  @Published var numberOfSixes = 6
  @Published var numberOfSevens = 7
  @Published var numberOfEights = 8
  @Published var numberOfNines = 9
  @Published var numberOfTens = 10
  @Published var numberOfElevens = 11
  @Published var numberOfTwelves = 12

  @Published var numberOfFlipThrees = 3
  @Published var numberOfSecondChances = 3
  @Published var numberOfFreezes = 3
  @Published var numberOfTimesTwos = 1
  @Published var numberOfPlusTwos = 1
  @Published var numberOfPlusFours = 1
  @Published var numberOfPlusSixes = 1
  @Published var numberOfPlusEights = 1
  @Published var numberOfPlusTens = 1

  // TODO: Start-Numbers of cards? For reseting
  // If card is not 0-12, do not count towards probability
  // func to check for that - see if raw value is between 0 and 99

  let numberOfAllCards = 1 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 3 + 3 + 3 + 1 + 1 + 1 + 1 + 1 + 1
  func numberOfCardsRemaining() -> Int {
    numberOfZeroes + numberOfOnes + numberOfTwos + numberOfThrees + numberOfFours + numberOfFives + numberOfSixes + numberOfSevens + numberOfEights + numberOfNines + numberOfTens + numberOfElevens + numberOfTwelves + numberOfFlipThrees + numberOfSecondChances + numberOfFreezes + numberOfTimesTwos + numberOfPlusTwos + numberOfPlusFours + numberOfPlusSixes + numberOfPlusEights + numberOfPlusTens
  }

  @Published var myCurrentCards: [Flip7CardType] = []

  func chanceToFailOnNextCard() -> String {
    if myCurrentCards.contains(.secondChance) {
      return 0.asPercentage()
    }


    var numberOfDangerousCards = 0

    // Get own cards
    for card in myCurrentCards {
      // The amount of each remaining
      numberOfDangerousCards += getAmountofCards(for: card)
    }

    // Calculate against all remaning cards
    let odds: Double = Double(numberOfDangerousCards) / Double(numberOfCardsRemaining())

    return odds.asPercentage()
  }

  private func getAmountofCards(for card: Flip7CardType) -> Int {
    switch card {
    case .zero:
      return numberOfZeroes
    case .one:
      return numberOfOnes
    case .two:
      return numberOfTwos
    case .three:
      return numberOfThrees
    case .four:
      return numberOfFours
    case .five:
      return numberOfFives
    case .six:
      return numberOfSixes
    case .seven:
      return numberOfSevens
    case .eight:
      return numberOfEights
    case .nine:
      return numberOfNines
    case .ten:
      return numberOfTens
    case .eleven:
      return numberOfElevens
    case .twelve:
      return numberOfTwelves
    case .flipThree:
      return numberOfFlipThrees
    case .secondChance:
      return numberOfSecondChances
    case .freeze:
      return numberOfFreezes
    case .timesTwo:
      return numberOfTimesTwos
    case .plusTwo:
      return numberOfPlusTwos
    case .plusFour:
      return numberOfPlusFours
    case .plusSix:
      return numberOfPlusSixes
    case .plusEight:
      return numberOfPlusEights
    case .plusTen:
      return numberOfPlusTens
    }
  }

  func myCurrentCardDisplay() -> String {
    var returnString = ""
    for card in myCurrentCards {
      let addComma = myCurrentCards.count > 1
      switch card {
      case .zero:
        returnString.append(addCardToString(card: "0", addComma: addComma))
      case .one:
        returnString.append(addCardToString(card: "1", addComma: addComma))
      case .two:
        returnString.append(addCardToString(card: "2", addComma: addComma))
      case .three:
        returnString.append(addCardToString(card: "3", addComma: addComma))
      case .four:
        returnString.append(addCardToString(card: "4", addComma: addComma))
      case .five:
        returnString.append(addCardToString(card: "5", addComma: addComma))
      case .six:
        returnString.append(addCardToString(card: "6", addComma: addComma))
      case .seven:
        returnString.append(addCardToString(card: "7", addComma: addComma))
      case .eight:
        returnString.append(addCardToString(card: "8", addComma: addComma))
      case .nine:
        returnString.append(addCardToString(card: "9", addComma: addComma))
      case .ten:
        returnString.append(addCardToString(card: "10", addComma: addComma))
      case .eleven:
        returnString.append(addCardToString(card: "11", addComma: addComma))
      case .twelve:
        returnString.append(addCardToString(card: "12", addComma: addComma))
      case .flipThree:
        returnString.append(addCardToString(card: "Flip Three", addComma: addComma))
      case .secondChance:
        returnString.append(addCardToString(card: "2nd Chance", addComma: addComma))
      case .freeze:
        returnString.append(addCardToString(card: "Freeze", addComma: addComma))
      case .timesTwo:
        returnString.append(addCardToString(card: "x2", addComma: addComma))
      case .plusTwo:
        returnString.append(addCardToString(card: "+2", addComma: addComma))
      case .plusFour:
        returnString.append(addCardToString(card: "+4", addComma: addComma))
      case .plusSix:
        returnString.append(addCardToString(card: "+6", addComma: addComma))
      case .plusEight:
        returnString.append(addCardToString(card: "+8", addComma: addComma))
      case .plusTen:
        returnString.append(addCardToString(card: "+10", addComma: addComma))
      }
    }

    return returnString

    func addCardToString(card: String, addComma: Bool) -> String {
      var returnString = ""
      returnString.append(card)
      if addComma {
        returnString.append(", ")
      }
      return returnString
    }
  }

  func endTurn() {
    myCurrentCards = []
  }

  func myCardReceived(cardType: Flip7CardType) {
    myCurrentCards.append(cardType)
    myCurrentCards.sort()

    switch cardType {
    case .zero:
      numberOfZeroes -= 1
    case .one:
      numberOfOnes -= 1
    case .two:
      numberOfTwos -= 1
    case .three:
      numberOfThrees -= 1
    case .four:
      numberOfFours -= 1
    case .five:
      numberOfFives -= 1
    case .six:
      numberOfSixes -= 1
    case .seven:
      numberOfSevens -= 1
    case .eight:
      numberOfEights -= 1
    case .nine:
      numberOfNines -= 1
    case .ten:
      numberOfTens -= 1
    case .eleven:
      numberOfElevens -= 1
    case .twelve:
      numberOfTwelves -= 1
    case .flipThree:
      numberOfFlipThrees -= 1
    case .secondChance:
      numberOfSecondChances -= 1
    case .freeze:
      numberOfFreezes -= 1
    case .timesTwo:
      numberOfTimesTwos -= 1
    case .plusTwo:
      numberOfPlusTwos -= 1
    case .plusFour:
      numberOfPlusFours -= 1
    case .plusSix:
      numberOfPlusSixes -= 1
    case .plusEight:
      numberOfPlusEights -= 1
    case .plusTen:
      numberOfPlusTens -= 1
    }
  }

  func otherCardReceived(cardType: Flip7CardType) {
    switch cardType {
    case .zero:
      numberOfZeroes -= 1
    case .one:
      numberOfOnes -= 1
    case .two:
      numberOfTwos -= 1
    case .three:
      numberOfThrees -= 1
    case .four:
      numberOfFours -= 1
    case .five:
      numberOfFives -= 1
    case .six:
      numberOfSixes -= 1
    case .seven:
      numberOfSevens -= 1
    case .eight:
      numberOfEights -= 1
    case .nine:
      numberOfNines -= 1
    case .ten:
      numberOfTens -= 1
    case .eleven:
      numberOfElevens -= 1
    case .twelve:
      numberOfTwelves -= 1
    case .flipThree:
      numberOfFlipThrees -= 1
    case .secondChance:
      numberOfSecondChances -= 1
    case .freeze:
      numberOfFreezes -= 1
    case .timesTwo:
      numberOfTimesTwos -= 1
    case .plusTwo:
      numberOfPlusTwos -= 1
    case .plusFour:
      numberOfPlusFours -= 1
    case .plusSix:
      numberOfPlusSixes -= 1
    case .plusEight:
      numberOfPlusEights -= 1
    case .plusTen:
      numberOfPlusTens -= 1
    }
  }
}

struct ContentView: View {
  @ObservedObject private var viewModel = ViewModel()

  var body: some View {
    VStack {
      Text("Flip7 Calculator")
        .padding(.bottom, 48)

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

extension Double {
  func round(to places: Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return (self * divisor).rounded() / divisor
  }

  func asPercentage() -> String {
    "\(self.round(to: 2) * 100)%"
  }
}

struct NumberButton: View {
  let text: String
  let action: () -> Void

  var body: some View {
    Button(
      action: action,
      label: {
        Text(text)
          .foregroundStyle(Color.white)
          .padding()
          .background(Color.gray)
          .cornerRadius(12)
          .shadow(radius: 6)
      }
    )
  }
}

#Preview {
  ContentView()
}
