//
//  LazyHStackUiView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 9/8/23.
//
//A view that arranges its children in a line that grows horizontally, creating items only as needed.

import SwiftUI

struct LazyHStackUiView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 10) {
                ForEach(1...100, id: \.self) {
                    Text("Column \($0)")
                        .padding()
                    
                    Divider()
                        .frame(height: 60)
                }
            }
        }.padding()
        
        .navigationTitle("LazyHStack")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBackButton())
    }
}

struct LazyHStackUiView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHStackUiView()
    }
}
