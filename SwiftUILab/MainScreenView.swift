//
//  ContentView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import SwiftUI

struct MainScreenView: View {
    
    private let gridColumn = [
        GridItem(.flexible(),alignment: .top),
        GridItem(.flexible(),alignment: .top)
    ]
    
    var body: some View {
        ZStack{
            LazyVGrid(
                columns: gridColumn,
                alignment: .leading,
                content: {
                    ForEach(0..<50){index in
                        Text("Hello")
                            .font(.titleLight)
                    }
                }
            )
        }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
        
        .navigationTitle("Compose Lab")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
