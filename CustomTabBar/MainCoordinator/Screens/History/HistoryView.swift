//
//  HistoryView.swift
//  CustomTabBar
//
//  Created by raul on 29.02.2024.
//

import SwiftUI

struct HistoryView: View {
  // MARK: - Properties
  
  @ObservedObject var viewModel: HistoryViewModel
  
  // MARK: - Body
  
  var body: some View {
    VStack {
      Spacer()
      Text(viewModel.tabItem.name)
        .font(.largeTitle)
        .foregroundColor(.white)
      
      if viewModel.isEditModeEnabled {
        Text("Edit Mode on")
          .font(.callout)
      }
      
      Button(action: {
        viewModel.didSelectEditMode()
      }, label: {
        Text(viewModel.isEditModeEnabled ? "Save" : "Edit")
      })
      .buttonStyle(.bordered)
      
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .background(viewModel.tabItem.backgroundColor)
  }
}

#Preview {
  HistoryView(viewModel: HistoryViewModel())
}
