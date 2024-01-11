//
//  LazyVStackUiView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 9/8/23.
//

//A view that arranges its children in a line that grows vertically, creating items only as needed.
import SwiftUI

struct LazyVStackUiView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(1...100, id: \.self) {
                    Text("Row \($0)")
                        .padding(10)
                    Divider()
                }
            }
        }.padding(.horizontal,16)
        
        .navigationTitle("LazyVStack")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBackButton())
    }
}

struct LazyVStackUiView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStackUiView()
    }
}
