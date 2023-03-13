//
//  CompletionViewModel.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/12/23.
//

import SwiftUI

class CompletionViewModel {
  weak var coordinator: FlowCoordinator?
  
  init(coordinator: FlowCoordinator?) {
    self.coordinator = coordinator
  }
  
  func popToRoot() {
    coordinator?.popToRoot()
  }
}
