//
//  ExtrudedButton.swift
//  Flip7Calculator
//
//  Created by Matthias Zarzecki on 23.12.25.
//

import SwiftUI

// TODO: Figure out pressed down variant - no lower shaddows, smaller, moved downwards

struct ExtrudedButton: View {
  let text: String
  let backgroundColor: Color = Color(red: 88/255, green: 204/255, blue: 2/255)

  // TODO: Automatically calculate shadow darker from main color
  let shadowColor: Color = Color(red: 70/255, green: 168/255, blue: 0/255)
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Text(text)
        .font(.system(size: 17, weight: .heavy))
        .foregroundColor(.white)
        //.frame(maxWidth: .infinity)
        //.padding(.vertical, 18)
        .padding()
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

#Preview(traits: .sizeThatFitsLayout) {
  ExtrudedButton(text: "Continue") {}
    .padding()
}
