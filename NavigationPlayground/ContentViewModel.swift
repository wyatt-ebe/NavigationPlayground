//
//  ContentViewModel.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
  @Published var path = NavigationPath()
  
  let platforms: [PlatformData]
  
  // TODO: Setup per Platform
  var flowCoordinator: FlowCoordinator?
  let viewFactory: ViewFactory = ViewFactory()
  
  init() {
    self.platforms = ContentViewModel.platformDataArray
    self.flowCoordinator = FlowCoordinator(popToRoot: {  })
  }
  
  func serveView(_ platformData: PlatformData) -> some View {
    setupFlow(platformData: platformData)
    return serveView(.Platform(data: platformData))
  }

  func serveView(_ viewType: ViewType) -> some View {
    viewFactory.create(type: viewType, coordinator: flowCoordinator!)
  }
  
  func popToRoot() {
    self.path = NavigationPath()
  }
}

extension ContentViewModel {
  static var platformDataArray: [PlatformData] {
    [
      .init(name: "Xbox", image: "xbox.logo", color: .green),
      .init(name: "Playstation", image: "playstation.logo", color: .blue),
      .init(name: "PC", image: "play.desktopcomputer", color: .black)
    ]
  }
}

extension ContentViewModel {
  func setupFlow(platformData: PlatformData) {
    switch platformData.name {
    case "Xbox":
      flowCoordinator = FlowCoordinator(flow: xboxFlow,
                                        popToRoot: popToRoot)
    case "Playstation", "PC":
      flowCoordinator = FlowCoordinator(flow: playstationFlow,
                                        popToRoot: popToRoot)
    default:
      break
    }
  }
  
  var xboxFlow: [ViewType] {
    [
      .Platform(data: PlatformData(name: "Xbox", image: "xbox.logo", color: .green)),
      .FollowUp,
      .Completion
    ]
  }
  
  var playstationFlow: [ViewType] {
    [
      .Platform(data: PlatformData(name: "Playstation", image: "playstation.logo", color: .blue)),
      .FollowUp,
      .Completion
    ]
  }
}
