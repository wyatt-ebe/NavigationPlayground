//
//  FlowCoordinator.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/12/23.
//

import SwiftUI

class FlowCoordinator {
  let flow: [ViewType]
  
  init(flow: [ViewType]) {
    self.flow = flow
  }
  
  @ViewBuilder
  func serveNextView(from source: ViewType?) -> some View {
    if let source = source,
       let sourceIndex = flow.firstIndex(of: source) {
      let nextIndex = sourceIndex + 1
      if flow.count > nextIndex {
        serveView(type: flow[nextIndex])
      } else {
        EmptyView() // popback
      }
    } else if let first = flow.first {
      serveView(type: first) // assume if isn't found, presenting from root
    } else {
      EmptyView() // Impossible, could be error or throw if preferred
    }
  }
  
  @ViewBuilder
  func serveView(type: ViewType) -> some View {
    switch type {
    case .Xbox:
      XboxView(viewModel: makeXboxViewModel())
    case .Followup:
      Text("Follow Up View")
    case .Text(let string):
      Text(string)
    }
  }
  
  func makeXboxViewModel() -> XboxViewModel {
    let model = XboxViewModel()
    model.coordinator = self
    return model
  }
 
//  @ViewBuilder
//  func serveFollowUpView() -> some View {
//    Text("Follow Up View")
//  }
}

enum ViewType {
  case Xbox
  case Followup
  case Text(String)
}

extension ViewType: Hashable { }
