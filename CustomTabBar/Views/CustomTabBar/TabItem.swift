//
//  TabItem.swift
//  CustomTabBar
//
//  Created by raul on 29.02.2024.
//

import Foundation
import SwiftUI

protocol TabProtocol: Hashable, Comparable {
  var image: String { get }
  var name: String { get }
  var backgroundColor: Color { get }
}

protocol EditModeTabProtocol {
  var id: String { get }
  var image: String { get }
  var name: String? { get }
  var imageTintColor: Color { get }
}

// MARK: - TabItem

enum TabItem: Int, CaseIterable, TabProtocol {
  case home = 0
  case search
  case history
  case profile
    
  var image: String {
    switch self {
    case .home:
      "house.fill"
    case .search:
      "magnifyingglass"
    case .history:
      "clock.fill"
    case .profile:
      "person.fill"
    }
  }
  
  var name: String {
    switch self {
    case .home:
      "Home"
    case .search:
      "Search"
    case .history:
      "History"
    case .profile:
      "Profile"
    }
  }
  
  var backgroundColor: Color {
    switch self {
    case .home:
      Color.green
    case .search:
      Color.red
    case .history:
      Color.brown
    case .profile:
      Color.cyan
    }
  }
  
  static func < (lhs: TabItem, rhs: TabItem) -> Bool {
    lhs.rawValue < rhs.rawValue
  }
}


// MARK: - HistoryEditMode

enum HistoryEditModeType: Int, CaseIterable, EditModeTabProtocol {
  case back = 0
  case deleted
  case unfavorites
  case favorites
  
  var id: String {
    return "\(rawValue)" + image + (name ?? "")
  }
  
  var image: String {
    switch self {
    case .back:
      "arrow.backward"
    case .deleted:
      "trash.fill"
    case .favorites:
      "star.fill"
    case .unfavorites:
      "star.slash.fill"
    }
  }
  
  var name: String? {
    switch self {
    case .deleted:
      "Deleted"
    case .favorites:
      "Favorites"
    case .unfavorites:
      "Unfavorites"
    default:
      nil
    }
  }
  
  var imageTintColor: Color {
    switch self {
    case .back:
      .secondary
    case .deleted:
      .red
    case .favorites:
      .secondary
    case .unfavorites:
      .yellow
    }
  }
}

