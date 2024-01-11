//
//  GridUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 10/8/23.
//

import SwiftUI

struct GridUIView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Simple Grid Row:")
                .font(.subheadlineMedium)
                .padding(16)
            
            Grid{
                GridRow{
                    Text("Hello")
                    Image(systemName: "globe")
                }
                
                Divider()
                    //.gridCellUnsizedAxes(.horizontal)
                
                GridRow{
                    Image(systemName: "hand.wave")
                    Text("World")
                }
            }
            
            Text("Grid Column Count:")
                .font(.subheadlineMedium)
                .padding(16)
            
            Grid(alignment: .bottom, horizontalSpacing: 1, verticalSpacing: 1) {
                GridRow {
                    Text("Row 1")
                    ForEach(0..<2) { _ in Color.red }
                }.frame(height: 50)
                GridRow {
                    Text("Row 2")
                    ForEach(0..<5) { _ in Color.green }
                }.frame(height: 50)
                GridRow {
                    Text("Row 3")
                    ForEach(0..<4) { _ in Color.blue }
                }.frame(height: 50)
            }
            
        }.frame(maxHeight: .infinity, alignment: .top)
        
        
        .navigationTitle("Grid")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBackButton())
    }
}

struct GridUIView_Previews: PreviewProvider {
    static var previews: some View {
        GridUIView()
    }
}
