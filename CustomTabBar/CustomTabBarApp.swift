//
//  CustomTabBarApp.swift
//  CustomTabBar
//
//  Created by raul on 26.02.2024.
//

import SwiftUI

@main
struct CustomTabBarApp: App {
  
  let mainCoordinator = MainCoordinator()
  
  var body: some Scene {
    WindowGroup {
      MainCoordinatorView(coordinator: mainCoordinator)
    }
  }
}
