//
//  XboxView.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

struct XboxView: View {
  let viewModel: XboxViewModel
  
  var body: some View {
    VStack {
      Image(systemName: "xbox.logo")
        .resizable()
        .scaledToFit()
        .foregroundColor(.green)
        .padding(.horizontal, 100)
        .padding(.bottom, 12)
      NavigationLink(destination: viewModel.serveView) {
        Text("Next")
          .foregroundColor(.white)
          .padding(12)
          .background(.gray)
          .cornerRadius(18)
      }
    }
  }
}

struct XboxView_Previews: PreviewProvider {
  static var previews: some View {
    let model = XboxViewModel()
    XboxView(viewModel: model)
  }
}
