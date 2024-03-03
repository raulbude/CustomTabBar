//
//  SearchView.swift
//  CustomTabBar
//
//  Created by raul on 29.02.2024.
//

import SwiftUI

struct SearchView: View {
  // MARK: - Properties
  
  @ObservedObject var viewModel: SearchViewModel
  
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
    SearchView(viewModel: SearchViewModel())
}
