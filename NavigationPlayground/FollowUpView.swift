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
      Text("Programmatic Push")
        .padding(.bottom, 12)
      Text("Next")
        .foregroundColor(.white)
        .padding(12)
        .background(.gray)
        .cornerRadius(18)
        .onTapGesture {
          viewModel.pushNextView()
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
