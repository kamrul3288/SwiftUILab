//
//  SearchViewModel.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 3/10/23.
//

import Foundation
import Combine

@MainActor
class SearchViewModel : ObservableObject{
    @Published private(set) var isLoading = true
    @Published private(set) var countries:[Country] = []
    @Published private(set) var filteredCountries:[Country] = []
    @Published var searchText:String = ""
    var isSearchActive:Bool {!searchText.isEmpty}
    private var cancelables = Set<AnyCancellable>()
    
    init(){
        addSearchCountriesDebounce()
    }
    
    func loadCountries()async{
        do{
            try await Task.sleep(for: .seconds(0.5))
            isLoading = false
            countries = try await getAllCountries()
        }catch{
            print("Fake: network failed")
        }
    }
    
    private func addSearchCountriesDebounce(){
        $searchText.debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] text in
                self?.filterCountries(searchText: text)
            }
            .store(in: &cancelables)
    }
    
    private func filterCountries(searchText:String){
        guard !searchText.isEmpty else{
            filteredCountries = []
            return
        }
        
        let filterList = countries.filter { country in
            country.name.lowercased().contains(searchText.lowercased())
        }
        print(filterList.count)
        filteredCountries = filterList
    }
    
    
    private func getAllCountries() async throws -> [Country]{
        [
            Country(name: "United States", flag: "\u{1F1FA}\u{1F1F8}"),
            Country(name: "Canada", flag: "\u{1F1E8}\u{1F1E6}"),
            Country(name: "United Kingdom", flag: "\u{1F1EC}\u{1F1E7}"),
            Country(name: "Germany", flag: "\u{1F1E9}\u{1F1EA}"),
            Country(name: "France", flag: "\u{1F1EB}\u{1F1F7}"),
            Country(name: "Japan", flag: "\u{1F1EF}\u{1F1F5}"),
            Country(name: "Australia", flag: "\u{1F1E6}\u{1F1FA}"),
            Country(name: "Brazil", flag: "\u{1F1E7}\u{1F1F7}"),
            Country(name: "India", flag: "\u{1F1EE}\u{1F1F3}"),
            Country(name: "China", flag: "\u{1F1E8}\u{1F1F3}"),
            Country(name: "South Korea", flag: "\u{1F1F0}\u{1F1F7}"),
            Country(name: "Mexico", flag: "\u{1F1F2}\u{1F1FD}"),
            Country(name: "Italy", flag: "\u{1F1EE}\u{1F1F9}"),
            Country(name: "Spain", flag: "\u{1F1EA}\u{1F1F8}"),
            Country(name: "Russia", flag: "\u{1F1F7}\u{1F1FA}"),
            Country(name: "South Africa", flag: "\u{1F1FF}\u{1F1E6}"),
            Country(name: "Turkey", flag: "\u{1F1F9}\u{1F1F7}"),
            Country(name: "Argentina", flag: "\u{1F1E6}\u{1F1F7}"),
            Country(name: "Nigeria", flag: "\u{1F1F3}\u{1F1EC}"),
            Country(name: "Saudi Arabia", flag: "\u{1F1F8}\u{1F1E6}"),
        ]
    }
}

internal struct Country : Identifiable{
    let id:String = UUID().uuidString
    let name: String
    let flag: String
}
