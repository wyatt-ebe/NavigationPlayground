//
//  CompletionView.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/12/23.
//

import SwiftUI

struct CompletionView: View {
  let viewModel: CompletionViewModel
  
  var body: some View {
    VStack {
      Text("Completion View")
        .padding(.bottom, 12)
      Text("Pop to root")
        .foregroundColor(.white)
        .padding(12)
        .background(.gray)
        .cornerRadius(18)
        .onTapGesture {
          viewModel.popToRoot()
        }
    }
  }
}

struct CompletionView_Previews: PreviewProvider {
  static var previews: some View {
    let model = CompletionViewModel(coordinator: nil)
    CompletionView(viewModel: model)
  }
}
