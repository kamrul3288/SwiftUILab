//
//  NavigationHost.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import Foundation
import SwiftUI

struct NavigationHost : View {
    @ObservedObject var router = NavigationRouter()
    var body: some View {
        NavigationStack(path: $router.navigationRoutes) {
            MainScreenView()
                .navigationDestination(for: NavigationRoute.self) { route in
                    
                }
        }.environmentObject(router)
    }
}
