//
//  HomeView.swift
//  CustomTabBar
//
//  Created by raul on 29.02.2024.
//

import SwiftUI

struct HomeView: View {
  // MARK: - Properties
  
  @ObservedObject var viewModel: HomeViewModel
  
  // MARK: - Body
  
  var body: some View {
    VStack {
      Spacer()
      Text(viewModel.tabItem.name)
        .font(.largeTitle)
        .foregroundColor(.white)
      
      Button(action: {
        viewModel.didTapPushNext()
      }, label: {
        Text("Push Next")
      })
      .buttonStyle(.bordered)
      
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .background(viewModel.tabItem.backgroundColor)
  }
}

#Preview {
  HomeView(viewModel: HomeViewModel())
}
