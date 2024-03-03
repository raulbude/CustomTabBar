//
//  MainCoordinatorView.swift
//  CustomTabBar
//
//  Created by raul on 29.02.2024.
//

import SwiftUI

struct MainCoordinatorView: View {
  // MARK: - Properties
  
  @ObservedObject var coordinator: MainCoordinator
  
  // MARK: - Body
  
  var body: some View {
    CustomTabBarView(viewModel: coordinator.tabBarViewModel, viewForTab: { tab in
      NavigationStack {
        switch tab {
        case .history:
          HistoryView(viewModel: coordinator.historyViewModel)
        case .home:
          HomeView(viewModel: coordinator.homeViewModel)
            .navigationDestination(isPresented: $coordinator.shouldPushNextHomeScreen) {
              HomeNextScreen(didTapBackButton: {
                coordinator.shouldPushNextHomeScreen = false
              })
                .navigationBarBackButtonHidden()
            }
        case .search:
          SearchView(viewModel: coordinator.searchViewModel)
        case .profile:
          ProfileView(viewModel: coordinator.profileViewModel)
        }
      }
    })
  }
}

#Preview {
  MainCoordinatorView(coordinator: MainCoordinator())
}
