//
//  LayoutAdjustmentUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 14/8/23.
//

import SwiftUI

struct LayoutAdjustmentUIView: View {
    private let layoutAdjustmentItems = [
        LayoutItem(title: "Padding", icon: "circle.grid.cross", route: NavigationRoute.PaddingView),
        LayoutItem(title: "Frame", icon: "square.and.arrow.up", route: NavigationRoute.FrameView),
        LayoutItem(title: "Fixed Size", icon: "pencil.tip.crop.circle", route: NavigationRoute.FixedSizeiew),
        LayoutItem(title: "Layout Priority", icon: "tray.2", route: NavigationRoute.LayoutPriorityView),
        LayoutItem(title: "Position", icon: "paperclip.circle", route: NavigationRoute.PositionView),
        LayoutItem(title: "Offset", icon: "football.circle", route: NavigationRoute.OffsetView),
        LayoutItem(title: "Alignment", icon: "globe.americas", route: NavigationRoute.AlignmentView),
    ]
    
    private let columns = [
        GridItem(.flexible(),alignment: .center),
        GridItem(.flexible(),alignment: .center),
        GridItem(.flexible(),alignment: .center)
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(layoutAdjustmentItems, id: \.id) { item in
                    NavigationLink(value: item.route) {
                        VStack{
                            Image(systemName: item.icon)
                                .font(.title3Light)
                                .padding(.bottom,4)
                            
                            Text(item.title)
                                .font(.subheadlineMedium)
                        }
                        .frame(maxWidth: .infinity,minHeight: 100,maxHeight: 100)
                        .background(Color.Black95)
                        .cornerRadius(10)
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
