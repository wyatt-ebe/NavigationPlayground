//
//  ContentViewModel.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
  var activeFlowCoordinator: FlowCoordinator?
  
  let platforms: [Platform] = [
    .init(name: "Xbox", image: "xbox.logo", color: .green),
    .init(name: "Playstation", image: "playstation.logo", color: .blue),
    .init(name: "PC", image: "play.desktopcomputer", color: .black)
  ]
  
  @ViewBuilder
  func serveView(_ platform: Platform) -> some View {
    let _ = setupFlow(platform)
    if let coord = activeFlowCoordinator {
      coord.serveNextView(from: nil)
    } else {
      EmptyView()
    }
  }
  
  func setupFlow(_ platform: Platform) -> Bool {
    switch platform.name {
    case "Xbox":
      activeFlowCoordinator = FlowCoordinator(flow: [.Xbox, .Followup])
    case "Playstation", "PC":
      activeFlowCoordinator = FlowCoordinator(flow: [.Text(platform.name)])
    default:
      break
    }
    return true
  }
}
