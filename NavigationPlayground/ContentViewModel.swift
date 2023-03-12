//
//  ContentViewModel.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
  @Published var path = NavigationPath()
  
  // TODO: Setup per Platform
  var flowCoordinator: FlowCoordinator?
  let viewFactory: ViewFactory = ViewFactory()
  
  init() {
    self.flowCoordinator = FlowCoordinator(popToRoot: { self.path = NavigationPath() })
  }
  
  let platforms: [PlatformData] = [
    .init(name: "Xbox", image: "xbox.logo", color: .green),
    .init(name: "Playstation", image: "playstation.logo", color: .blue),
    .init(name: "PC", image: "play.desktopcomputer", color: .black)
  ]
  
  @ViewBuilder
  func serveView(_ platform: PlatformData) -> some View {
    viewFactory.create(type: .Platform(data: platform), coordinator: flowCoordinator!)
  }
  
//  func setupFlow(_ platform: Platform) -> Bool {
//    switch platform.name {
//    case "Xbox":
//      activeFlowCoordinator = FlowCoordinator(flow: [.Xbox, .FollowUp, .Completion],
//                                              triggerPopback: {  })
//    case "Playstation", "PC":
//      activeFlowCoordinator = FlowCoordinator(flow: [.Text(platform.name)],
//                                              triggerPopback: {  })
//    default:
//      break
//    }
//    return true
//  }
}
