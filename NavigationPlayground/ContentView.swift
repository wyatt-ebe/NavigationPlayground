//
//  ContentView.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

struct ContentView: View {
  let viewModel: ContentViewModel
  
  init(viewModel: ContentViewModel = ContentViewModel()) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    NavigationStack {
      List(viewModel.platforms, id: \.self) { platform in
        NavigationLink(value: platform) {
          Label(platform.name, systemImage: platform.image)
            .foregroundColor(platform.color)
        }
      }
      .navigationDestination(for: Platform.self) {
        Text($0.name)
      }
      .navigationTitle("Platforms")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
