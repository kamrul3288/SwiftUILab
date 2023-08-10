//
//  LazyHGridUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 10/8/23.
//

import SwiftUI

struct LazyHGridUIView: View {
    let rows = [
        GridItem(.fixed(30),spacing: 50),
        GridItem(.fixed(30),spacing: 50),
        GridItem(.fixed(30))
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(0x1f600...0x1f679, id: \.self) { value in
                    Text(emoji(value))
                        .font(.largeTitleRegular)
                }
            }
        }
        
        .navigationBarWithBackButton(title: "LazyHGerid")
    }
    
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

struct LazyHGridUIView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridUIView()
    }
}
