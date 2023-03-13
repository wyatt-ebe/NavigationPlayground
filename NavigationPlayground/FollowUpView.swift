//
//  FollowUpView.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

struct FollowUpView: View {
  let viewModel: FollowUpViewModel
  
  var body: some View {
    VStack {
      Text("Follow Up View")
        .padding(.bottom, 12)
      NavigationLink(value: viewModel.serveViewData()) {
        Text("Next")
          .foregroundColor(.white)
          .padding(12)
          .background(.gray)
          .cornerRadius(18)
      }
    }
  }
}

struct FollowUpView_Previews: PreviewProvider {
  static var previews: some View {
    let model = FollowUpViewModel(coordinator: nil)
    FollowUpView(viewModel: model)
  }
}
