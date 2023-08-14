//
//  PositionUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/8/23.
//

import SwiftUI

struct PositionUIView: View {
    var body: some View {
        ZStack{
            Text("Position by passing a CGPoint()")
                .position(CGPoint(x: 150, y: 100))
            
            Text("Position by passing the x and y coordinates")
                .position(x: 175, y: 150)
        }
        .navigationBarWithBackButton(title: "Position")
    }
}

struct PositionUIView_Previews: PreviewProvider {
    static var previews: some View {
        PositionUIView()
    }
}
