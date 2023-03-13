//
//  FlowCoordinator.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/12/23.
//

import SwiftUI

class FlowCoordinator {
  static var flow: [ViewType] {
    [
      .Platform(data: PlatformData(name: "Xbox", image: "xbox.logo", color: .green)),
      .Platform(data: PlatformData(name: "Playstation", image: "playstation.logo", color: .blue)),
      .FollowUp,
      .Completion
    ]
  }
  
  let first: ViewType
  let pattern: [ViewType:ViewType]
  let popToRoot: () -> Void
  
  init(flow: [ViewType] = FlowCoordinator.flow,
       popToRoot: @escaping () -> Void) {
    (self.first, self.pattern) = FlowCoordinator.arrayToDict(flow)
    self.popToRoot = popToRoot
  }
  
  static func arrayToDict(_ flow: [ViewType]) -> (first: ViewType, dict: [ViewType:ViewType]) {
    guard flow.count > 0 else {
      return (.Completion, [:])
    }
    var prev: ViewType = flow.first!
    var pattern = [ViewType:ViewType]()
    for type in flow[1...] {
      pattern[prev] = type
      prev = type
    }
    return (flow.first!, pattern)
  }
  
  func getNextViewType(from source: ViewType?) -> ViewType {
    if let source = source,
       let next = pattern[source] {
      return next
    } else {
      return first
    }
  }
}

class ViewFactory {
  @ViewBuilder
  func create(type: ViewType,
              coordinator: FlowCoordinator?) -> some View {
    switch type {
    case .Platform(let data):
      PlatformView(viewModel: .init(platform: data, coordinator: coordinator))
    case .FollowUp:
      FollowUpView(viewModel: .init(coordinator: coordinator))
    case .Completion:
      CompletionView(viewModel: .init(coordinator: coordinator))
    }
  }
}

enum ViewType {
  case Platform(data: PlatformData)
  case FollowUp
  case Completion
}

extension ViewType: Hashable { }
