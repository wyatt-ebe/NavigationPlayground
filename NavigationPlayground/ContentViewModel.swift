//
//  ContentViewModel.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
  @Published var path = NavigationPath()
  
  let platforms: [PlatformData] = [
    .init(name: "Xbox", image: "xbox.logo", color: .green),
    .init(name: "Playstation", image: "playstation.logo", color: .blue),
    .init(name: "PC", image: "play.desktopcomputer", color: .red)
  ]
  
  var flowCoordinator: FlowCoordinator?
  let viewFactory: ViewFactory = ViewFactory()
  
  func serveView(_ platformData: PlatformData) -> some View {
    setupFlow(platformData: platformData)
    let next = flowCoordinator!.getNextViewType(from: nil)
    return serveView(next)
  }

  func serveView(_ viewType: ViewType) -> some View {
    viewFactory.create(type: viewType, coordinator: flowCoordinator!)
  }
  
  func popToRoot() {
    self.path = NavigationPath()
  }
  
  func pushToPath(_ type: ViewType) {
    self.path.append(type)
  }
  
  func handleDeepLink() {
    flowCoordinator = FlowCoordinator(flow: deepLinkFlow, popToRoot: popToRoot, pushToPath: pushToPath)
    path = NavigationPath(deepLinkFlow)
  }
}

extension ContentViewModel {
  func setupFlow(platformData: PlatformData) {
    let flow: [ViewType]
    switch platformData.name {
    case "Xbox":
      flow = xboxFlow
    case "Playstation":
      flow = playstationFlow
    case "PC":
      flow = pcFlow
    default:
      flow = [.Completion]
    }
    flowCoordinator = FlowCoordinator(flow: flow, popToRoot: popToRoot, pushToPath: pushToPath)
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
      .Completion
    ]
  }
  
  var pcFlow: [ViewType] {
    [
      .Platform(data: PlatformData(name: "PC", image: "play.desktopcomputer", color: .red)),
      .Completion
    ]
  }
  
  
  var deepLinkFlow: [ViewType] {
    [
      .Platform(data: PlatformData(name: "Xbox", image: "xbox.logo", color: .green)),
      .Platform(data: PlatformData(name: "Playstation", image: "playstation.logo", color: .blue)),
      .Platform(data: PlatformData(name: "PC", image: "play.desktopcomputer", color: .red)),
    ]
  }
}
