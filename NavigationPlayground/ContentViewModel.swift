//
//  ContentViewModel.swift
//  NavigationPlayground
//
//  Created by Wyatt on 3/11/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
  let platforms: [Platform] = [
    .init(name: "Xbox", image: "xbox.logo", color: .green),
    .init(name: "Playstation", image: "playstation.logo", color: .blue),
    .init(name: "PC", image: "play.desktopcomputer", color: .black)
  ]
}
