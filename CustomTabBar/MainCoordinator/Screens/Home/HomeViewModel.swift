//
//  HomeViewModel.swift
//  CustomTabBar
//
//  Created by raul on 29.02.2024.
//

import Combine

final class HomeViewModel: ObservableObject {
  // MARK: - Properties
  
  let tabItem = TabItem.home
  
  let pushNext = PassthroughSubject<Void, Never>()

  // MARK: - Functions
  
  func didTapPushNext() {
    pushNext.send()
  }
}
