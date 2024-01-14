//
//  PreferenceKeyBasic.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/1/24.
//

import SwiftUI

struct PreferenceKeyBasicView: View {
    @State var value = ""
    var body: some View {
        SecondaryView(value: value)
            .onPreferenceChange(BasicPreferenceKey.self, perform: { value in
                self.value = value
            })
    }
}

fileprivate struct SecondaryView : View {
    let value:String
    var body: some View {
        Text(value)
            .preference(key: BasicPreferenceKey.self, value: "value from secondary screen")
    }
}

fileprivate struct BasicPreferenceKey : PreferenceKey{
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}


#Preview {
    PreferenceKeyBasicView()
}
