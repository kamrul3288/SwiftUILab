//
//  ObservableAndStateObjectViewModel.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 23/8/23.
//

import Foundation
class ObservableAndStateObjectViewModel : ObservableObject{
    @Published var countryList:[Country] = []
    @Published var isLoading:Bool = false
    
    init(){
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){[weak self] in
                self?.isLoading = false
                self?.prepareCountryList()
            }
            
        }
    
    private func prepareCountryList(){
           countryList.append(Country(id: 1, name: "Bangladesh"))
           countryList.append(Country(id: 2, name: "India"))
           countryList.append(Country(id: 3, name: "Nepal"))
           countryList.append(Country(id: 4, name: "Bhutan"))
           countryList.append(Country(id: 5, name: "Maldiv"))
    }
       
    func delete(index:IndexSet){
           countryList.remove(atOffsets: index)
    }
    
    struct Country : Identifiable{
        let id: Int
        let name:String
    }
}
