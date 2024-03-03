//
//  MainCoordinator.swift
//  CustomTabBar
//
//  Created by raul on 29.02.2024.
//

import Combine
import SwiftUI

final class MainCoordinator: ObservableObject {
  // MARK: - Properties
  
  var selectedTab = TabItem.home
  let allItems = TabItem.allCases
  
  let historyViewModel = HistoryViewModel()
  let searchViewModel = SearchViewModel()
  let profileViewModel = ProfileViewModel()
  let homeViewModel = HomeViewModel()
  let tabBarViewModel = CustomTabBarViewModel()
  
  @Published var shouldPushNextHomeScreen = false {
    didSet {
      tabBarViewModel.handleBottomBar(shouldHide: shouldPushNextHomeScreen)
    }
  }
  
  private var observers = Set<AnyCancellable>()
  
  // MARK: - Init
  
  init() {
    setupObservers()
  }
  
  // MARK: - Functions
  
  private func setupObservers() {
    homeViewModel.pushNext.sink { [weak self] _ in
      self?.shouldPushNextHomeScreen = true
    }.store(in: &observers)
    
    historyViewModel.showEditModeAction.sink { [weak self] shouldShow in
      guard let self else { return }
      tabBarViewModel.editModeActions = historyViewModel.editModeActions
      withAnimation {
        self.tabBarViewModel.isEditModeEnabled = shouldShow
      }
    }.store(in: &observers)
    
    tabBarViewModel.editModeAction.sink { [weak self] actionType in
      if let actionType =  actionType as? HistoryEditModeType {
        self?.historyViewModel.handleAction(actionType)
      }
    }.store(in: &observers)
  }
}
