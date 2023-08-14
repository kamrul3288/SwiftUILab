//
//  LayoutAdjustmentUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/8/23.
//

import SwiftUI

struct LayoutAdjustmentUIView: View {
    private let layoutAdjustmentItems = [
        LayoutItem(title: "Padding", icon: "space", route: NavigationRoute.PaddingView),
        LayoutItem(title: "Frame", icon: "paperplane.fill", route: NavigationRoute.FrameView),
        LayoutItem(title: "Fixed Size", icon: "basketball.circle", route: NavigationRoute.FixedSizeiew),
        LayoutItem(title: "Layout Priority", icon: "rosette", route: NavigationRoute.LayoutPriorityView),
        LayoutItem(title: "Position", icon: "wake", route: NavigationRoute.PositionView),
        LayoutItem(title: "Offset", icon: "timelapse", route: NavigationRoute.OffsetView),
        LayoutItem(title: "Alignment", icon: "dot.circle.and.cursorarrow", route: NavigationRoute.AlignmentView),
    ]
    
    private let columns = [
        GridItem(.flexible(),alignment: .center),
        GridItem(.flexible(),alignment: .center)
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(layoutAdjustmentItems, id: \.id) { item in
                    NavigationLink(value: item.route) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(Color.card)

                            VStack{
                                Image(systemName: item.icon)
                                    .padding(.bottom,8)
                                    .font(.title3Thin)
                                    .fontWeight(.light)
                                Text(item.title)
                                    .font(.subheadlineMedium)
                            }
                        }
                        .frame(height: 100)
                        .shadow(radius: 0.1)
                    }
                    .buttonStyle(.plain)
                }
            }.padding()
        }
        .navigationBarWithBackButton(title: "Layout Adjustment")
    }
}

struct LayoutAdjustmentUIView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutAdjustmentUIView()
    }
}
