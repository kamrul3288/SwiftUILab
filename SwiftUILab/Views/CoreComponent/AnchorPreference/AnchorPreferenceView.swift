//
//  AnchorPreferenceView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 10/9/23.
//

/*
 PreferenceKey protocol is used to produce values that can be communicated up in the view hierarchy.
 It allows a child view to communicate with the parent view.
 This is very similar to how Environment variable works but the opposite.
 Environment is used to send data down the view hierarchy.
 */

import SwiftUI
struct AnchorPreferenceView: View {
    @State private var selectedCategory:Categorty?
    private let categories = [
        Categorty(id: "Home", symbol: "house.circle"),
        Categorty(id: "Location", symbol: "location.circle"),
        Categorty(id: "Favourite", symbol: "heart.circle"),
        Categorty(id: "Account", symbol: "person.circle")
    ]
    
    var body: some View {
        VStack{
            GeometryReader { proxy in
                HStack(spacing: 0){
                    ForEach(categories) { category in
                        CategoryButton(category: category, selection: $selectedCategory,width: proxy.size.width * 0.25)
                    }
                }
            }.frame(height: 100)
                
        }
        .overlayPreferenceValue(CategortyPreferenceKey.self){preferences in
            GeometryReader{proxy in
                if let selected = preferences.first(where:{$0.category == selectedCategory}){
                    let frame =  proxy[selected.anchor]
                    Rectangle()
                        .fill(Color.primaryColor)
                        .frame(width: frame.width, height: 2)
                        .position(x:frame.midX,y: frame.maxY+8)
                }
            }
        }
        .navigationBarWithBackButton(title: "Anchor Preference")
    }
}

fileprivate struct CategoryButton : View{
    var category:Categorty
    @Binding var selection:Categorty?
    var width:Double
    
    var body: some View{
        Button {
            withAnimation{
                selection = category
            }
        } label: {
            VStack{
                Image(systemName: category.symbol)
                Text(category.id)
            }
        }
        .frame(width: width)
        .buttonStyle(.plain)
        .anchorPreference(key:CategortyPreferenceKey.self,value: .bounds,transform: {
            [CategortyPreference(category: category, anchor: $0)]})

    }
}


fileprivate struct Categorty: Identifiable, Equatable{
    let id: String
    let symbol:String
}

fileprivate struct CategortyPreference : Equatable{
    let category:Categorty
    //An opaque value derived from an anchor source and a particular view.
    //position of source view
    let anchor:Anchor<CGRect>
}

fileprivate struct CategortyPreferenceKey : PreferenceKey{
    static var defaultValue = [CategortyPreference]()
    /// Combines a sequence of values by modifying the previously-accumulated
    /// value with the result of a closure that provides the next value.
    ///
    /// This method receives its values in view-tree order. Conceptually, this
    /// combines the preference value from one tree with that of its next
    /// sibling.
    ///
    /// - Parameters:
    ///   - value: The value accumulated through previous calls to this method.
    ///     The implementation should modify this value.
    ///   - nextValue: A closure that returns the next value in the sequence.
    static func reduce(value: inout [CategortyPreference], nextValue: () -> [CategortyPreference]) {
        value.append(contentsOf: nextValue())
    }
}


struct AnchorPreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        AnchorPreferenceView()
    }
}
