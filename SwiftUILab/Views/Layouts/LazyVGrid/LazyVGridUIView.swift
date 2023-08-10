//
//  LazyVGridUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 10/8/23.
//

import SwiftUI

struct LazyVGridUIView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0x1f600...0x1f679, id: \.self) { value in
                    Text(emoji(value)).font(.largeTitleRegular)
                }
            }
        }
        
        .navigationBarWithBackButton(title: "LazyVGerid")

    }
    
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

struct LazyVGridUIView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridUIView()
    }
}
