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

fileprivate struct Category : Identifiable, Equatable{
    let id: String
    let symbol:String
}

fileprivate struct CategoryPreference{
    let category:Category
    let anchor:Anchor<CGRect>
}

fileprivate struct CategoryPreferenceKey : PreferenceKey{
    static var defaultValue: [CategoryPreference] = []
    static func reduce(value: inout [CategoryPreference], nextValue: () -> [CategoryPreference]) {
        value.append(contentsOf: nextValue())
    }
}

struct AnchorPreferenceView : View {
    private let categories = [
        Category(id: "Home", symbol: "house.circle"),
        Category(id: "Location", symbol: "location.circle"),
        Category(id: "Favourite", symbol: "heart.circle"),
        Category(id: "Account", symbol: "person.circle"),
    ]
    @State private var selectedCategory:Category?
    
    var body: some View {
        HStack(spacing: 20){
            ForEach(categories){category in
                Button(action: {
                    withAnimation {
                        selectedCategory = category
                    }
                },label: {
                    VStack{
                        Image(systemName: category.symbol)
                        Text(category.id)
                    }
                })
                .anchorPreference(key: CategoryPreferenceKey.self, value: .bounds, transform: { anchor in
                    [CategoryPreference(category: category, anchor: anchor)]
                })
            }
        }
        .overlayPreferenceValue(CategoryPreferenceKey.self){preferences in
            GeometryReader{proxy in
                if let selected = preferences.first(where:{$0.category == selectedCategory}){
                    let frame =  proxy[selected.anchor]
                    Rectangle()
                        .fill(Color.Primary)
                        .frame(width: frame.width, height: 2)
                        .position(x:frame.midX,y: frame.maxY+8)
                }
            }
        }
    }
}

#Preview{
    AnchorPreferenceView()
}
