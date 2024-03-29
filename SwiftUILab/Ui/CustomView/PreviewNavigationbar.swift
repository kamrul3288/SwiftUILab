//
//  PreviewNavigationbar.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 2/10/23.
//

import SwiftUI


struct PreviewNavigationbar<Content:View>: View {
    @Environment(\.colorScheme) var colorScheme
    let content:Content
    init(@ViewBuilder content:()->Content){
        self.content = content()
    }
    var body: some View {
        NavigationStack{
            content
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(colorScheme == .dark ?  .dark : .light , for: .navigationBar)
                .toolbarBackground(Color.Black95, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
