//
//  LayoutsUiView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 3/8/23.
//

import SwiftUI

struct LayoutsUiView: View {
    var body: some View {
        Text("Hello, World!")
        
        
        .navigationTitle("Layouts")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBackButton())

    }
}

struct LayoutsUiView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutsUiView()
    }
}
