//
//  XboxView.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

struct PlatformView: View {
  let viewModel: PlatformViewModel
  
  var body: some View {
    VStack {
      Image(systemName: viewModel.image)
        .resizable()
        .scaledToFit()
        .foregroundColor(viewModel.color)
        .padding(.horizontal, 100)
        .padding(.bottom, 12)
      NavigationLink(value: viewModel.serveViewData()) {
        Text("Next")
          .foregroundColor(.white)
          .padding(12)
          .background(.gray)
          .cornerRadius(18)
      }
    }
    .navigationTitle(viewModel.name)
  }
}

struct PlatformView_Previews: PreviewProvider {
  static var previews: some View {
    let model = PlatformViewModel(platform: PlatformData(name: "Preview",
                                                     image: "xbox.logo",
                                                     color: .green))
    PlatformView(viewModel: model)
  }
}
