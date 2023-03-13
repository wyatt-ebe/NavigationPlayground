//
//  ContentView.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel: ContentViewModel = .init()
  
  var body: some View {
    NavigationStack(path: $viewModel.path) {
      List {
        Section("Platforms") {
          ForEach(viewModel.platforms, id: \.self) { platform in
            NavigationLink(value: platform) {
              Label(platform.name, systemImage: platform.image)
                .foregroundColor(platform.color)
            }
          }
        }
        Section("Manipulations") {
          Label("Deep Link", systemImage: "arrow.right")
            .foregroundColor(.black)
            .onTapGesture {
              viewModel.handleDeepLink()
            }
        }
      }
      .navigationTitle("Navigation")
      .navigationDestination(for: PlatformData.self) {
        viewModel.serveView($0)
      }
      .navigationDestination(for: ViewType.self) {
        viewModel.serveView($0)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
