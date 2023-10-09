//
//  NavDrawerUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 9/10/23.
//

import SwiftUI

struct NavDrawerUIView: View {
    @State private var isDrawerOpen = false
    @State private var drawerDragOffset:CGFloat = .zero
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                NavigationView{
                    List{
                        ForEach(1...100,id: \.self){index in
                            Text("Item: \(index)")
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring){
                            isDrawerOpen = false
                        }
                    }
                    .navigationTitle("Nav Drawer")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(
                        leading: Button(
                            action: {
                                withAnimation(){
                                    isDrawerOpen.toggle()
                                }
                            },
                            label: {
                                Image(systemName: "line.horizontal.3")
                                    .foregroundColor(.white)
                            }
                        ),
                        trailing: NavBackButton()
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight:.infinity)
            .gesture(
                DragGesture()
                    .onChanged{value in
                        let horizontalDistance = value.translation.width
                        let isOpening = horizontalDistance > 0
                        let shouldOpen = (isOpening && horizontalDistance > 100) || (!isOpening && horizontalDistance < -100)
                        withAnimation {
                            isDrawerOpen = shouldOpen
                        }
                    }
            )
            
            .overlay(alignment: .leading) {
                drawerView()
                    .ignoresSafeArea(edges: .bottom)
                    .offset(x: isDrawerOpen  ? 0 : -geometry.size.width)
                    .offset(x:drawerDragOffset)
                    .frame(width: geometry.size.width * 0.8)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if value.translation.width < -100 {
                                    withAnimation {
                                        isDrawerOpen = false
                                    }
                                }
                            }
                    )
            }
        }
        .navigationBarHidden(true)
    }
    
    private func drawerView() -> some View{
        LazyVStack{
            Circle()
                .frame(width: 100)
                .foregroundColor(.white)
            
            Group{
                Text("Kamrul Hasan")
                    .font(.title3Regular)
                Text("+880xxxxxxxxx")
            }
            .foregroundColor(.white)

            Divider()
                .overlay(.white)
            Spacer()
            
            Group{
                HStack(spacing: 16){
                    Image(systemName: "tray")
                    Text("Inbox")
                    Spacer()
                    Text("1")
                }
               
                
                HStack(spacing: 16){
                    Image(systemName: "star")
                    Text("Stared")
                    Spacer()
                    Text("100+")
                }
                
                HStack(spacing: 16){
                    Image(systemName: "clock")
                    Text("Snoozed")
                }
                
                HStack(spacing: 16){
                    Image(systemName: "bookmark")
                        .rotationEffect(Angle(degrees: 90))
                    Text("Important")
                }
                
                Text("All labels")
                
                HStack(spacing: 16){
                    Image(systemName: "location")
                    Text("Sent")
                    Spacer()
                    Text("10")
                }
                
                HStack(spacing: 16){
                    Image(systemName: "timer")
                    Text("Schedule")
                }
                
                HStack(spacing: 16){
                    Image(systemName: "xmark.bin")
                    Text("Trash")
                }
            }
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,16)
            .padding(.vertical,8)
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background(Color.primaryColor)
    }
    
}

#Preview {
    PreviewNavigationbar{
        NavDrawerUIView()
    }
}
