//
//  ProgressbarUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 8/10/23.
//

import SwiftUI

struct ProgressbarUIView: View {
    @State private var progress = 0.6
    
    var body: some View {
        VStack{
            ProgressView(value: 0.25){
                Text("25% progress")
            }
            ProgressView(value: 0.75){
                Text("75% progress")
            }
            
            ProgressView()
            Spacer()
        }
        .progressViewStyle(BorderedProgressViewStyle())
        .padding()
        .navigationBarWithBackButton(title:"Progressbar")
    }
}

fileprivate struct BorderedProgressViewStyle : ProgressViewStyle{
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding(10)
    }
}

#Preview {
    PreviewNavigationbar{
        ProgressbarUIView()
    }
}
