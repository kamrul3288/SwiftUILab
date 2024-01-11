//
//  FrameUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/8/23.
//

import SwiftUI

struct FrameUIView: View {
    var body: some View {
        VStack(spacing: 20){
            
            Text("Text width: 300 and height: 50")
                .frame(width: 300,height: 50)
                .border(.yellow)
            
            
            Text("Text max width: 300 and max height: 50")
                .frame(maxWidth: 300,maxHeight: 50)
                .border(.yellow)
            
            Text("Text min width: 300 and min height: 50")
                .frame(minWidth: 300,minHeight: 50)
                .border(.yellow)
            
            Text("Text width: 300 and height: 100, Alignment:Bottom")
                .frame(width: 300,height: 100, alignment: .bottom)
                .border(.yellow)

        }
        .navigationBarWithBackButton(title: "Frame")
    }
}

struct FrameUIView_Previews: PreviewProvider {
    static var previews: some View {
        FrameUIView()
    }
}
