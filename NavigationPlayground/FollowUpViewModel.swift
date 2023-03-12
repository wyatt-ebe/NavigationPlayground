//
//  FollowUpViewModel.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/12/23.
//

import SwiftUI

class FollowUpViewModel {
//  weak var coordinator: FlowCoordinator?
  
  @ViewBuilder
  func serveView() -> some View {
    CompletionView(viewModel: .init())
//    if let coordinator = coordinator {
//      coordinator.serveNextView(from: .FollowUp)
//    } else {
//      EmptyView()
//    }
  }
}

