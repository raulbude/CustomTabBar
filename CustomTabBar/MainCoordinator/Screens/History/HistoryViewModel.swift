//
//  HistoryViewModel.swift
//  CustomTabBar
//
//  Created by raul on 29.02.2024.
//

import Foundation
import Combine
import SwiftUI

final class HistoryViewModel: ObservableObject {
  // MARK: - Properties
  
  let tabItem = TabItem.history
  let editModeActions = HistoryEditModeType.allCases
  let showEditModeAction = PassthroughSubject<Bool, Never>()
  @Published var isEditModeEnabled = false
  
  // MARK: - Functions
  
  func didSelectEditMode() {
    withAnimation { [weak self] in
      guard let self else { return }
      isEditModeEnabled.toggle()
      showEditModeAction.send(isEditModeEnabled)
    }
  }
  
  func handleAction(_ action: HistoryEditModeType) {
    // here handle action from tab bar
    print("Action \(action.name ?? "")")
  }
}
