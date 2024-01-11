//
//  SearchUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 3/10/23.
//

import SwiftUI

struct SearchUIView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    init(){
        // cancel button color
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.white], for: .normal)
        // search bar background color
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        // cursor color
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
        // always use light theme
        UISearchBar.appearance().overrideUserInterfaceStyle = .light

    }
    
    
    var body: some View {
       
        ZStack{
            
            if (viewModel.isLoading){
                ProgressView()
    
                
            } else{
                List{
                    ForEach(viewModel.isSearchActive ? viewModel.filteredCountries : viewModel.countries){country in
                        HStack(spacing: 20){
                            Text(country.flag)
                                .font(.title3Regular)
                                .fontWeight(.bold)
                            Text(country.name)
                                .font(.headlineRegular)
                                .fontWeight(.medium)
                        }
                        .padding(.vertical,20)
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .scrollContentBackground(.hidden)
                }
                .scrollIndicators(.hidden)
                
                //-------------added searchable for search bar----------------
                .searchable(text: $viewModel.searchText,placement: .toolbar,prompt: Text("Search Country..."))
            }
        }
        .navigationBarWithBackButton(title: "Search")
        .task {
            await viewModel.loadCountries()
        }
    }
}

#Preview {
    PreviewNavigationbar{
        SearchUIView()
    }
}
