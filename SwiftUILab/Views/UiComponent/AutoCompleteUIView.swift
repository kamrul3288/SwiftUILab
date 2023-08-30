//
//  AutoCompleteUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 30/8/23.
//

import SwiftUI

struct AutocompleteTextField: View {
    @State private var searchText = ""
    @State private var isShowingSuggestions = false
    
    // Example list of autocomplete suggestions
    let autocompleteSuggestions = ["Apple", "Banana", "Cherry", "Grapes", "Orange"]
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .onChange(of: searchText) { newValue in
                    isShowingSuggestions = !newValue.isEmpty
                }
                .padding()
            
            if isShowingSuggestions {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(autocompleteSuggestions.filter {
                            searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText)
                        }, id: \.self) { suggestion in
                            Button(action: {
                                searchText = suggestion
                                isShowingSuggestions = false
                            }) {
                                Text(suggestion)
                                    .padding(.vertical, 8)
                            }
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.top, 5)
                }
                .frame(maxHeight: 150)
                .overlay(Color.clear, alignment: .bottom) // Overlay to push suggestions down
            }
        }
        .padding()
    }
}


struct AutoCompleteUIView_Previews: PreviewProvider {
    static var previews: some View {
        AutocompleteTextField()
    }
}
