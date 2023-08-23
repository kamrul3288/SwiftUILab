//
//  CodeableViewModel.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 23/8/23.
//

import Foundation

class CodeableViewModel : ObservableObject{
    @Published var customer:CustomerModel? = nil
    
    
    init() {
        fetchFakeCustomerData()
    }
    
    private func fetchFakeCustomerData(){
        guard let json = getJSONData() else{return}
        
        // Manually Covert JSON
        // It's very difficult to write this code manually it's takes lots of boilarplate code
        
        if
            let data = try? JSONSerialization.jsonObject(with: json),
            let dictionary = data  as? [String:Any],
            let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String
        {
            customer = CustomerModel(name: name, id: id)
        }

    }
    
    //--------Prepare fake json data--------
    private func getJSONData()->Data?{
        let dictionary:[String:Any] = [
            "id" : "1",
            "name" : "Kamrul Hasan"
        ]
        let json = try? JSONSerialization.data(withJSONObject: dictionary)
        return json
    }
    
    struct CustomerModel{
        let name:String
        let id:String
    }
}


