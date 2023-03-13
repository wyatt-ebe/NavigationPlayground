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
  
  func pushNextView() {
    guard let type = coordinator?.getNextViewType(from: .FollowUp) else { return }
    coordinator?.pushToPath(type)
  }
}

