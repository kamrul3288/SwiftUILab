//
//  OffsetUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/8/23.
//

import SwiftUI

struct OffsetUIView: View {
    var body: some View {
        VStack(spacing: 50){
            Text("Offset by passing CGSize()")
                .border(.green)
                .offset(CGSize(width: 20, height: 20))
                .border(.yellow)
            
            Text("Offset by passing horizontal & vertical distance")
                .border(.green)
                .offset(x:20,y:50)
                .border(.yellow)
        }
        .navigationBarWithBackButton(title: "Offset")
    }
}

struct OffsetUIView_Previews: PreviewProvider {
    static var previews: some View {
        OffsetUIView()
    }
}
