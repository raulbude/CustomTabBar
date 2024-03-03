//
//  CustomTabBarView.swift
//  CustomTabBar
//
//  Created by raul on 29.02.2024.
//

import SwiftUI

struct CustomTabBarView<Content: View>: View {
  
  @ObservedObject var viewModel: CustomTabBarViewModel
  var viewForTab: (TabItem) -> Content
  
  private let bottomBarPadding: CGFloat = 60
  
  var body: some View {
    ZStack {
      viewForTab(viewModel.previousSelected)
      
      ForEach(viewModel.allItems, id: \.self) { item in
        if viewModel.selectedTab == item {
          viewForTab(item)
            .transition(.move(edge: viewModel.selectedTab > viewModel.previousSelected ? .trailing : .leading))
        }
      }
      
      GeometryReader { proxy in
        VStack {
          Spacer()
          ZStack {
            Color.white
            tabButtons
              .coordinateSpace(name: "tabButtons")
              .offset(x: !viewModel.isEditModeEnabled ? 0 : -proxy.frame(in: .named("tabButtons")).width)
            editModeButtons
              .coordinateSpace(name: "editButtons")
              .offset(x: viewModel.isEditModeEnabled ? 0 : proxy.frame(in: .named("editButtons")).width)
          }
          .frame(height: 60)
          .frame(width: UIScreen.main.bounds.width - 32)
          .cornerRadius(20)
          .coordinateSpace(name: "tabButtonsView")
          .padding([.leading, .trailing], 16)
          .padding([.bottom], bottomBarPadding)
          .offset(x: 0, y: viewModel.shouldHideBottomBar ? proxy.frame(in: .named("tabButtonsView")).height + bottomBarPadding : 0)
        }
        .transition(.move(edge: .bottom))
      }
    }
  }
  
  var tabButtons: some View {
    HStack {
      ForEach(viewModel.allItems, id: \.rawValue) { item in
        Button(action: {
          viewModel.selectItem(item)
        }, label: {
          Image(systemName: item.image)
            .resizable()
            .scaledToFit()
            .tint(viewModel.selectedTab == item ? .primary : .secondary)
            .frame(width: 32, height: 32)
        })
        .frame(maxWidth: .infinity)
      }
    }
  }
  
  var editModeButtons: some View {
    HStack {
      ForEach(viewModel.editModeActions, id: \.id) { item in
        Button(action: {
          viewModel.didSelectEditAction(item)
        }, label: {
          Image(systemName: item.image)
            .resizable()
            .scaledToFit()
            .tint(item.imageTintColor)
            .frame(width: 32, height: 32)
        })
        .frame(maxWidth: .infinity)
      }
    }
  }
}
