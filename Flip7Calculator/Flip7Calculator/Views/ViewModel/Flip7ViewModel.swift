//
//  Flip7ViewModel.swift
//  Flip7Calculator
//
//  Created by Matthias Zarzecki on 01.01.26.
//

import Combine

class Flip7ViewModel: ObservableObject {
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
