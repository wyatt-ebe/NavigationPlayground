//
//  XboxViewModel.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

class PlatformViewModel {
  let platform: PlatformData
  var name: String { platform.name }
  var image: String { platform.image }
  var color: Color { platform.color }
  
  weak var coordinator: FlowCoordinator?
  
  init(platform: PlatformData,
       coordinator: FlowCoordinator? = nil) {
    self.platform = platform
    self.coordinator = coordinator
  }
  
  func serveViewData() -> ViewType {
    let current = ViewType.Platform(data: platform)
    if let next = coordinator?.getNextViewType(from: current) {
      return next
    }
    return .Completion
  }
}
