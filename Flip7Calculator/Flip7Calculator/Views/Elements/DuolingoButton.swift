//
//  DuolingoButton.swift
//  Flip7Calculator
//
//  Created by Matthias Zarzecki on 23.12.25.
//

import SwiftUI

struct DuolingoButton: View {
  let title: String
  let backgroundColor: Color
  let shadowColor: Color
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Text(title.uppercased())
        .font(.system(size: 17, weight: .heavy))
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18)
        .background(backgroundColor)
        .cornerRadius(16)
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(shadowColor, lineWidth: 0)
        )
    }
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(shadowColor)
        .offset(y: 4)
    )
    .padding(.bottom, 4)
  }
}

// Usage example:
/*
struct ContentView: View {
  var body: some View {
    VStack(spacing: 20) {
      DuolingoButton(
        title: "Continue",
        backgroundColor: Color(red: 88/255, green: 204/255, blue: 2/255),
        shadowColor: Color(red: 70/255, green: 168/255, blue: 0/255)
      ) {
        print("Continue tapped")
      }

      DuolingoButton(
        title: "Check",
        backgroundColor: .blue,
        shadowColor: .blue.opacity(0.7)
      ) {
        print("Check tapped")
      }
    }
    .padding()
  }
}*/
