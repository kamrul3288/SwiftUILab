//
//  FixedSizeUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/8/23.
//

import SwiftUI

struct FixedSizeUIView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("A single line of text, too long to fit in a box.")
                .frame(width: 200, height: 200)
                .border(Color.yellow)
            
            Text("A single line of text, too long to fit in a box.")
                .fixedSize(horizontal: true, vertical: false)
                .frame(width: 200, height: 200)
                .border(Color.red)
            
            Spacer()
        }
        .navigationBarWithBackButton(title: "Foxed Size")
    }
}

struct FixedSizeUIView_Previews: PreviewProvider {
    static var previews: some View {
        FixedSizeUIView()
    }
}
