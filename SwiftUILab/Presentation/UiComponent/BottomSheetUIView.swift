//
//  BottomSheetUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 2/10/23.
//

import SwiftUI

struct BottomSheetUIView: View {
    @State private var isShowingSheet = false
    @State private var isShowinProgramablegSheet = false
    @State private var presentationDetent:PresentationDetent = .medium
    @State private var isShowingFullScreenSheet = false
    
    @State private var initialHeightOffset:CGFloat = UIScreen.main.bounds.height * 0.8
    @State private var currentHeightOffset:CGFloat = .zero
    @State private var detentHeightOffset:CGFloat = .zero
    
    var body: some View {
        
        ZStack{
            VStack{
                
                Button(
                    action: {
                        isShowingSheet.toggle()
                    },
                    label: {
                        Text("Show Modal Sheet")
                            .modifier(FillColorButtonViewModifier())
                    }
                )
                
                Button(
                    action: {
                        isShowinProgramablegSheet.toggle()
                    },
                    label: {
                        Text("Show PresentationDetent Sheet")
                            .modifier(FillColorButtonViewModifier())
                    }
                )
                
                Button(
                    action: {
                        isShowingFullScreenSheet.toggle()
                    },
                    label: {
                        Text("Show Full Screen")
                            .modifier(FillColorButtonViewModifier())
                    }
                )
            }
            .padding()
            
            
            //-------------- Presistance OR Dragable sheet-------------
            VStack{
                Image(systemName: "livephoto")
                    .font(.title3Regular)
                    .padding()
                List{
                    ForEach(1...50, id:\.self){ index in
                        Text("Item: \(index)")
                            .listRowBackground(Color.clear)
                    }
                }
                .background(.clear)
                .scrollContentBackground(.hidden)

                
            }
            .frame(maxWidth: .infinity,maxHeight:.infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            .ignoresSafeArea(edges: .bottom)
            .offset(y:initialHeightOffset)
            .offset(y:currentHeightOffset)
            .offset(y:detentHeightOffset)
            .gesture(
                DragGesture()
                    .onChanged{value in
                        withAnimation(.spring){
                            currentHeightOffset = value.translation.height
                        }
                    }
                    .onEnded{ value in
                        withAnimation(.spring){
                            if(value.translation.height < -150){
                                detentHeightOffset = -(initialHeightOffset - 20)
                            }else if(value.translation.height > 150){
                                detentHeightOffset = .zero
                            }
                            currentHeightOffset = .zero
                        }
                    }
            )
        }
        
        //------------ Sheet example----------------------------
        .sheet(isPresented: $isShowingSheet){
            List{
                ForEach(1...50, id:\.self){ index in
                    Text("Item: \(index)")
                }
            }
            .presentationDetents([.medium,.large])
            //.presentationDetents([.fraction(0.2),.medium,.large])
            .presentationDragIndicator(.visible)
            //.interactiveDismissDisabled()
        }
        
        
        //------------ presentationDetents selection sheet----------------------------
        .sheet(isPresented: $isShowinProgramablegSheet){
            Button(
                action: {
                    presentationDetent = .large
                },
                label: {
                    Text("Full Screen")
                }
            )
            .presentationDetents([.medium, .large], selection: $presentationDetent)
            .presentationDragIndicator(.visible)
        }
        
        //---------- full screen sheet example-------------------
        .fullScreenCover(isPresented: $isShowingFullScreenSheet){
            VStack(alignment: .leading){
                Button(
                    action: {
                        isShowingFullScreenSheet.toggle()
                    },
                    label: {
                        Image(systemName: "xmark")
                            .font(.title3Regular)
                    }
                )
                .padding(16)
                List{
                    ForEach(1...50, id:\.self){ index in
                        Text("Item: \(index)")
                    }
                }
            }
        }
        .navigationBarWithBackButton(title: "Bottom Sheet")
    }
}

#Preview {
    PreviewNavigationbar{
        BottomSheetUIView()
    }
}
