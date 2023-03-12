//
//  XboxViewModel.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

class XboxViewModel {
  weak var coordinator: FlowCoordinator?
  
  @ViewBuilder
  func serveView() -> some View {
    if let coordinator = coordinator {
      coordinator.serveNextView(from: .Xbox)
    } else {
      EmptyView()
    }
  }
}
