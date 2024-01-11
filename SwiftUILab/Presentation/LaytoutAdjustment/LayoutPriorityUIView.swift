//
//  LayoutPriorityUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/8/23.
//

import SwiftUI

struct LayoutPriorityUIView: View {
    var body: some View {
        HStack(spacing: 20) {
            
            Text("This is a moderately long string.")
                    .padding()
                    .font(.subheadlineRegular)
                    .border(Color.yellow)

                Text("This is a higher priority string.")
                    .padding()
                    .font(.title2Bold)
                    .layoutPriority(1)
                    .border(Color.red)
        }
        
        .navigationBarWithBackButton(title: "LayoutPriority")
    }
}

struct LayoutPriorityUIView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPriorityUIView()
    }
}
