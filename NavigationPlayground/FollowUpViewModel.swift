//
//  FollowUpViewModel.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/12/23.
//

import SwiftUI

class FollowUpViewModel {
  weak var coordinator: FlowCoordinator?
  
  init(coordinator: FlowCoordinator?) {
    self.coordinator = coordinator
  }
  
  func serveViewData() -> ViewType {
    if let type = coordinator?.getNextViewType(from: .FollowUp) {
      return type
    }
    return .Completion
  }
}

