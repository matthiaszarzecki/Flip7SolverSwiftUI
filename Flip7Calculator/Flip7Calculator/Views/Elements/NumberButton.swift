//
//  NumberButton.swift
//  Flip7Calculator
//
//  Created by Matthias Zarzecki on 01.01.26.
//

import SwiftUI

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

#Preview(traits: .sizeThatFitsLayout) {
  NumberButton(text: "Hello") {}
    .padding()
}
