//
//  ProfileView.swift
//  CustomTabBar
//
//  Created by raul on 29.02.2024.
//

import SwiftUI

struct ProfileView: View {
  // MARK: - Properties
  
  @ObservedObject var viewModel: ProfileViewModel
  
  // MARK: - Body
  
  var body: some View {
    VStack {
      Spacer()
      Text(viewModel.tabItem.name)
        .font(.largeTitle)
        .foregroundColor(.white)
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .background(viewModel.tabItem.backgroundColor)
  }
}

#Preview {
  ProfileView(viewModel: ProfileViewModel())
}
