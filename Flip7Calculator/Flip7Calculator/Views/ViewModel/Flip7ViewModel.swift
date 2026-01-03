//
//  Flip7ViewModel.swift
//  Flip7Calculator
//
//  Created by Matthias Zarzecki on 01.01.26.
//

import Combine

struct CardStates {
  var numberOfZeroes = 1
  var numberOfOnes = 1
  var numberOfTwos = 2
  var numberOfThrees = 3
  var numberOfFours = 4
  var numberOfFives = 5
  var numberOfSixes = 6
  var numberOfSevens = 7
  var numberOfEights = 8
  var numberOfNines = 9
  var numberOfTens = 10
  var numberOfElevens = 11
  var numberOfTwelves = 12

  var numberOfFlipThrees = 3
  var numberOfSecondChances = 3
  var numberOfFreezes = 3
  var numberOfTimesTwos = 1
  var numberOfPlusTwos = 1
  var numberOfPlusFours = 1
  var numberOfPlusSixes = 1
  var numberOfPlusEights = 1
  var numberOfPlusTens = 1
}

class Flip7ViewModel: ObservableObject {
  /*@Published var numberOfZeroes = 1
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
  @Published var numberOfPlusTens = 1*/

  @Published var cardStates = CardStates()

  // TODO: Start-Numbers of cards? For reseting
  // If card is not 0-12, do not count towards probability
  // func to check for that - see if raw value is between 0 and 99

  // TODO: Use a dict for saving amounts of cards

  let numberOfAllCards = 1 + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 + 3 + 3 + 3 + 1 + 1 + 1 + 1 + 1 + 1
  func numberOfCardsRemaining() -> Int {
    cardStates.numberOfZeroes + cardStates.numberOfOnes + cardStates.numberOfTwos + cardStates.numberOfThrees + cardStates.numberOfFours + cardStates.numberOfFives + cardStates.numberOfSixes + cardStates.numberOfSevens + cardStates.numberOfEights + cardStates.numberOfNines + cardStates.numberOfTens + cardStates.numberOfElevens + cardStates.numberOfTwelves + cardStates.numberOfFlipThrees + cardStates.numberOfSecondChances + cardStates.numberOfFreezes + cardStates.numberOfTimesTwos + cardStates.numberOfPlusTwos + cardStates.numberOfPlusFours + cardStates.numberOfPlusSixes + cardStates.numberOfPlusEights + cardStates.numberOfPlusTens
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
        return cardStates.numberOfZeroes
      case .one:
        return cardStates.numberOfOnes
      case .two:
        return cardStates.numberOfTwos
      case .three:
        return cardStates.numberOfThrees
      case .four:
        return cardStates.numberOfFours
      case .five:
        return cardStates.numberOfFives
      case .six:
        return cardStates.numberOfSixes
      case .seven:
        return cardStates.numberOfSevens
      case .eight:
        return cardStates.numberOfEights
      case .nine:
        return cardStates.numberOfNines
      case .ten:
        return cardStates.numberOfTens
      case .eleven:
        return cardStates.numberOfElevens
      case .twelve:
        return cardStates.numberOfTwelves
      case .flipThree:
        return cardStates.numberOfFlipThrees
      case .secondChance:
        return cardStates.numberOfSecondChances
      case .freeze:
        return cardStates.numberOfFreezes
      case .timesTwo:
        return cardStates.numberOfTimesTwos
      case .plusTwo:
        return cardStates.numberOfPlusTwos
      case .plusFour:
        return cardStates.numberOfPlusFours
      case .plusSix:
        return cardStates.numberOfPlusSixes
      case .plusEight:
        return cardStates.numberOfPlusEights
      case .plusTen:
        return cardStates.numberOfPlusTens
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
      cardStates.numberOfZeroes -= 1
    case .one:
      cardStates.numberOfOnes -= 1
    case .two:
      cardStates.numberOfTwos -= 1
    case .three:
      cardStates.numberOfThrees -= 1
    case .four:
      cardStates.numberOfFours -= 1
    case .five:
      cardStates.numberOfFives -= 1
    case .six:
      cardStates.numberOfSixes -= 1
    case .seven:
      cardStates.numberOfSevens -= 1
    case .eight:
      cardStates.numberOfEights -= 1
    case .nine:
      cardStates.numberOfNines -= 1
    case .ten:
      cardStates.numberOfTens -= 1
    case .eleven:
      cardStates.numberOfElevens -= 1
    case .twelve:
      cardStates.numberOfTwelves -= 1
    case .flipThree:
      cardStates.numberOfFlipThrees -= 1
    case .secondChance:
      cardStates.numberOfSecondChances -= 1
    case .freeze:
      cardStates.numberOfFreezes -= 1
    case .timesTwo:
      cardStates.numberOfTimesTwos -= 1
    case .plusTwo:
      cardStates.numberOfPlusTwos -= 1
    case .plusFour:
      cardStates.numberOfPlusFours -= 1
    case .plusSix:
      cardStates.numberOfPlusSixes -= 1
    case .plusEight:
      cardStates.numberOfPlusEights -= 1
    case .plusTen:
      cardStates.numberOfPlusTens -= 1
    }
  }

  func otherCardReceived(cardType: Flip7CardType) {
    switch cardType {
    case .zero:
      cardStates.numberOfZeroes -= 1
    case .one:
      cardStates.numberOfOnes -= 1
    case .two:
      cardStates.numberOfTwos -= 1
    case .three:
      cardStates.numberOfThrees -= 1
    case .four:
      cardStates.numberOfFours -= 1
    case .five:
      cardStates.numberOfFives -= 1
    case .six:
      cardStates.numberOfSixes -= 1
    case .seven:
      cardStates.numberOfSevens -= 1
    case .eight:
      cardStates.numberOfEights -= 1
    case .nine:
      cardStates.numberOfNines -= 1
    case .ten:
      cardStates.numberOfTens -= 1
    case .eleven:
      cardStates.numberOfElevens -= 1
    case .twelve:
      cardStates.numberOfTwelves -= 1
    case .flipThree:
      cardStates.numberOfFlipThrees -= 1
    case .secondChance:
      cardStates.numberOfSecondChances -= 1
    case .freeze:
      cardStates.numberOfFreezes -= 1
    case .timesTwo:
      cardStates.numberOfTimesTwos -= 1
    case .plusTwo:
      cardStates.numberOfPlusTwos -= 1
    case .plusFour:
      cardStates.numberOfPlusFours -= 1
    case .plusSix:
      cardStates.numberOfPlusSixes -= 1
    case .plusEight:
      cardStates.numberOfPlusEights -= 1
    case .plusTen:
      cardStates.numberOfPlusTens -= 1
    }
  }
}
