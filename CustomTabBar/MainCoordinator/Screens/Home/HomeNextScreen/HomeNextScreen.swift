//
//  HomeNextScreen.swift
//  CustomTabBar
//
//  Created by raul on 01.03.2024.
//

import SwiftUI

struct HomeNextScreen: View {
  // MARK: - Properties
  
  var didTapBackButton: (() -> Void)
  
  // MARK: - Body
  
  var body: some View {
    VStack {
      Spacer()
      Button(action: {
        didTapBackButton()
      }, label: {
        Text("Back")
      })
      .buttonStyle(.bordered)
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .background(.brown)
  }
}

#Preview {
  HomeNextScreen(didTapBackButton: {})
}
