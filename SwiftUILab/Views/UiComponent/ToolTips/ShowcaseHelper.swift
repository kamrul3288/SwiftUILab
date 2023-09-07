//
//  ToolTipsHelperUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 4/9/23.
//

import SwiftUI
extension View{
    @ViewBuilder
    func showCase(order:Int, title:String, cornerRadius:CGFloat, style:RoundedCornerStyle = .continuous, scale:CGFloat = 1) -> some View{
        self
            .anchorPreference(key: ShowcaseHighLightAnchorKey.self, value: .bounds){anchor in
                let highlight = ShowcaseHightlight(anchor: anchor, title: title, cornerRadius: cornerRadius,style: style,scale: scale)
                return [order:highlight]
            }
    }
}

struct ShowcaseRoot : ViewModifier{
    var showHighlights:Bool
    var onFinished: ()-> ()
    
    @State private var highlightOrder:[Int] = []
    @State private var currentHightlight:Int = 0
    @State private var showView:Bool = true
    @State private var showTitle:Bool = false
    @Namespace private var animation
    
    func body(content: Content) -> some View {
        content
            .onPreferenceChange(ShowcaseHighLightAnchorKey.self){value in
                highlightOrder = Array(value.keys).sorted()
            }
            .overlayPreferenceValue(ShowcaseHighLightAnchorKey.self){preferences in
                if
                    highlightOrder.indices.contains(currentHightlight),
                    showHighlights,
                    showView
                {
                    if let hightlight = preferences[highlightOrder[currentHightlight]]{
                        ShowcaseHighlightView(hightlight)
                    }
                }
            }
    }
    
    @ViewBuilder
    func ShowcaseHighlightView(_ highlight:ShowcaseHightlight) -> some View{
        GeometryReader{proxy in
            let highlightRect = proxy[highlight.anchor]
            let safeArea = proxy.safeAreaInsets
            
            Rectangle()
                .fill(.black.opacity(0.5))
                .reverseMask {
                    Rectangle()
                        .matchedGeometryEffect(id: "TOOLTIPSSHAPE", in: animation)
                        .frame(width: highlightRect.width + 5,height: highlightRect.height + 5)
                        .clipShape(RoundedRectangle(cornerRadius: highlight.cornerRadius,style: highlight.style))
                        .scaleEffect(highlight.scale)
                        .offset(x:highlightRect.minX - 2.5, y:highlightRect.minY + safeArea.top - 2.5)
                }
            .ignoresSafeArea()
            .onTapGesture {
                print("call")

                if currentHightlight > highlightOrder.count - 1{
                    withAnimation(.easeOut(duration: 0.5)){
                        showView = false
                    }
                    onFinished()
                }else{
                    withAnimation(.interactiveSpring(response: 0.3,dampingFraction: 0.7, blendDuration: 0.7)){
                        showTitle = false
                        currentHightlight += 1
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.4){
                        showTitle = true
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                    showTitle = true
                }
            }
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: highlightRect.width + 20,height: highlightRect.height + 20)
                .clipShape(RoundedRectangle(cornerRadius: highlight.cornerRadius,style: highlight.style))
                .popover(isPresented: $showTitle) {
                    Text(highlight.title)
                        .padding(.horizontal,10)
                        .presentationCompactAdaptation(.popover)
                        .interactiveDismissDisabled()
                }
                .scaleEffect(highlight.scale)
                .offset(x:highlightRect.minX - 10, y:highlightRect.minY - 10)
                
        }
    }
}

extension View{
    func reverseMask<Content:View>(alignment:Alignment = .topLeading,@ViewBuilder content: @escaping ()->Content)->some View{
          self
            .mask {
                Rectangle()
                    .overlay(
                        alignment: .topLeading
                    ) {
                        content()
                            .blendMode(.destinationOut)
                    }
            }
    }
}

fileprivate struct ShowcaseHighLightAnchorKey : PreferenceKey{
    static var defaultValue: [Int:ShowcaseHightlight] = [:]

    static func reduce(value: inout [Int : ShowcaseHightlight], nextValue: () -> [Int : ShowcaseHightlight]) {
        value.merge(nextValue()) {$1}
    }
}
