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
  
  func serveViewData() -> PlatformData {
    let current = ViewType.Platform(data: platform)
    if let type = coordinator?.getNextViewType(from: current),
       case .Platform(let data) = type {
      return data
    } else {
      return PlatformData(name: "Fail", image: "figure.walk", color: .black)
    }
  }
}
