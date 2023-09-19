//
//  ToolTipsHelperUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 4/9/23.
//
import SwiftUI

//----------Step 2 create showcase preference key------------------
fileprivate struct ShowcasePreferenceKey : PreferenceKey{
    static var defaultValue: [Int:ShowcaseModel] = [:]
    static func reduce(value: inout [Int : ShowcaseModel], nextValue: () -> [Int : ShowcaseModel]) {
        value.merge(nextValue()) { key, value in
            value
        }
    }
}

//----------Step 3 Creating extension to apply anchorPreference------------------
extension View{
    @ViewBuilder
    func showCase(order:Int, title:String, cornerRadius:CGFloat, style:RoundedCornerStyle = .continuous, scale:CGFloat = 1) -> some View{
        self.anchorPreference(key: ShowcasePreferenceKey.self, value: .bounds) { anchor in
            let highlight = ShowcaseModel(anchor: anchor, title: title, cornerRadius: cornerRadius,style: style,scale: scale)
            return [order:highlight]
        }
    }
}

//----------Step 4 Creating ShowcaseRootViewModifier and showcase view------------------
struct ShowcaseRootViewModifier : ViewModifier{
    var isVisibileShowCaseRootView:Bool
    var onFinished: ()-> ()
    
    @State private var showCaseViewKeyOrderList:[Int] = []
    @State private var currentShowCaseViewKey:Int = 0
    @State private var isVisibleShowView:Bool = true
    @State private var isVisbleShowCaseTitle:Bool = false
    
    func body(content: Content) -> some View {
        content
            .onPreferenceChange(ShowcasePreferenceKey.self){value in
                showCaseViewKeyOrderList = Array(value.keys).sorted()
            }
            .overlayPreferenceValue(ShowcasePreferenceKey.self){preferences in
                if
                    showCaseViewKeyOrderList.indices.contains(currentShowCaseViewKey),
                    isVisibileShowCaseRootView,
                    isVisibleShowView
                {
                    if let hightlight = preferences[showCaseViewKeyOrderList[currentShowCaseViewKey]]{
                        ShowcaseView(hightlight)
                    }
                }
            }
    }
    
    @ViewBuilder
    func ShowcaseView(_ highlight:ShowcaseModel) -> some View{
        GeometryReader{proxy in
            let frame = proxy[highlight.anchor]
            let safeArea = proxy.safeAreaInsets
            
            Rectangle()
                .fill(.black.opacity(0.5))
                .mask{
                    Rectangle()
                        .overlay(alignment: .topLeading) {
                            Rectangle()
                                .frame(width: frame.width + 5,height: frame.height + 5)
                                .clipShape(RoundedRectangle(cornerRadius: highlight.cornerRadius,style: highlight.style))
                                .scaleEffect(highlight.scale)
                                .offset(x:frame.minX - 2.5, y:frame.minY + safeArea.top - 2.5)
                                .blendMode(.destinationOut)
                        }
                }
            .ignoresSafeArea()
            .onTapGesture {
                isVisbleShowCaseTitle = false
                if currentShowCaseViewKey >= showCaseViewKeyOrderList.count - 1{
                    withAnimation(.easeOut(duration: 0.5)){
                        isVisibleShowView = false
                        onFinished()
                    }
                }else{
                    withAnimation(.interactiveSpring(response: 0.3,dampingFraction: 0.7, blendDuration: 0.7)){
                        currentShowCaseViewKey += 1
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.4){
                        isVisbleShowCaseTitle = true
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                    isVisbleShowCaseTitle = true
                }
            }
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: frame.width + 20,height: frame.height + 20)
                .clipShape(RoundedRectangle(cornerRadius: highlight.cornerRadius,style: highlight.style))
                .popover(isPresented: $isVisbleShowCaseTitle) {
                    Text(highlight.title)
                        .padding(.horizontal,10)
                        .presentationCompactAdaptation(.popover)
                        .interactiveDismissDisabled()
                }
                .scaleEffect(highlight.scale)
                .offset(x:frame.minX - 10, y:frame.minY - 10)
                
        }
    }
}
