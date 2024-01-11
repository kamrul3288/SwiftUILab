//
//  NavigationBarExtension.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 10/8/23.
//

import Foundation
import SwiftUI


extension View{
    func navigationBarWithBackButton(title:String)-> some View {
        self.navigationTitle(title)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: NavBackButton())
    }
}
