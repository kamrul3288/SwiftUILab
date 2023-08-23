//
//  CodeableUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 16/8/23.
//

import SwiftUI
// In Swift, Codable is a combination of Encodable and Decodable

// Encodable means an object is convertible from Swift to JSON (or to another external representation).

// Decodable means an object is convertible from JSON (or other external representation) to Swift.

struct CodeableUIView: View {
    @StateObject var viewModel = CodeableViewModel()
    
    var body: some View {
        Text(viewModel.customer?.name ?? "parse_failed")
        
        .navigationBarWithBackButton(title: "Codeable")
    }
    
}

struct CodeableUIView_Previews: PreviewProvider {
    static var previews: some View {
        CodeableUIView()
    }
}
