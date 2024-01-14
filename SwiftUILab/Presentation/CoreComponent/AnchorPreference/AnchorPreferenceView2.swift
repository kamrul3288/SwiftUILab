//
//  AnchorPreferenceView2.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/1/24.
//

import SwiftUI

fileprivate struct BoundsPreferenceKey : PreferenceKey{
    static var defaultValue: Anchor<CGRect>? = nil
    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = nextValue()
    }
}

struct AnchorPreferenceView2: View {
    var body: some View {
        ZStack{
            Color.Primary
            VStack{
                Text("Hello World!")
                    .anchorPreference(key: BoundsPreferenceKey.self, value: .bounds, transform: {$0})
            }
        }
        .overlayPreferenceValue(BoundsPreferenceKey.self){preferences in
            GeometryReader{proxy in
                Rectangle()
                    .stroke()
                    .frame(width: proxy[preferences!].width,height: proxy[preferences!].height)
                    .offset(
                        x: proxy[preferences!].minX,
                        y: proxy[preferences!].minY
                    )
            }
        }
    }
}

#Preview {
    AnchorPreferenceView2()
}
