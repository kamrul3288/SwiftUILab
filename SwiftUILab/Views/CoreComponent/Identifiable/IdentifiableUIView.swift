//
//  IdentifiableUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 16/8/23.
//

import SwiftUI

// In Swift, Codable is a combination of Encodable and Decodable

// Encodable means an object is convertible from Swift to JSON (or to another external representation).

// Decodable means an object is convertible from JSON (or other external representation) to Swift.

// A class of types whose instances hold the value of an entity with stable identity.



struct IdentifiableUIView: View {
    struct PersonEntity: Identifiable{
        var id: String = UUID().uuidString
        let name:String
        let age:Int
    }
    @State var persons:[PersonEntity] = []
    
    var body: some View {
        List{
            ForEach(persons) { person in
                Text(person.name)
            }
            .onDelete(perform: remove)
        }
        .overlay(
            Button(action: {
                persons.append(
                    PersonEntity(name: "Kamrul Hasan", age: 28)
                )
            }, label: {
                Image(systemName: "plus")
            })
            .padding()
            .background(Color.primaryColor)
            .foregroundColor(.white)
            .clipShape(Circle()),
            alignment: .bottomTrailing
        ).padding()
        
        .navigationBarWithBackButton(title: "@Identifiable")
        
    }
    
    private func remove(at offset:IndexSet){
        persons.remove(atOffsets: offset)
    }
}
