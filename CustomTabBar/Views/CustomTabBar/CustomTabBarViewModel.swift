//
//  CustomTabBarViewModel.swift
//  CustomTabBar
//
//  Created by raul on 01.03.2024.
//

import Foundation
import SwiftUI
import Combine

final class CustomTabBarViewModel: ObservableObject {
  // MARK: - Properties
  
  @Published var allItems = TabItem.allCases
  @Published var selectedTab = TabItem.home
  @Published var previousSelected = TabItem.home
  @Published var editModeActions: [EditModeTabProtocol] = []
  @Published var shouldHideBottomBar = false
  @Published var isEditModeEnabled = false
  
  var editModeAction = PassthroughSubject<EditModeTabProtocol, Never>()
  
  // MARK: - Functions
  
  func selectItem(_ item: TabItem) {
    previousSelected = selectedTab
    withAnimation(.easeInOut) {
      selectedTab = item
    }
  }
  
  func didSelectEditAction(_ action: EditModeTabProtocol) {
    editModeAction.send(action)
  }
  
  func handleBottomBar(shouldHide: Bool) {
    withAnimation(.easeInOut(duration: 0.6)) { [weak self] in
      self?.shouldHideBottomBar = shouldHide
    }
  }
}
