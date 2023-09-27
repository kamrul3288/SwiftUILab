//
//  DragGestureUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 27/9/23.
//

import SwiftUI

struct DragGestureUIView: View {
    @State var offset:CGSize = .zero
    @State var minHeightOffset:CGFloat = UIScreen.main.bounds.height * 0.80
    @State var currentDragOffset:CGFloat = .zero
    @State var endingDragOffset:CGFloat = .zero
    
    var body: some View {
        ZStack {
            //----------------Card Swipe View----------------------
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.primaryColor)
                .frame(width: 300,height: 500)
                .overlay{
                    Text("Swipe Left / Right")
                        .foregroundColor(.white)
                        .font(.title3Regular)
                }
                .offset(x:offset.width)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRorationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring){
                                offset = value.translation
                            }
                        }
                        .onEnded{value in
                            withAnimation(.spring){
                                offset = .zero
                            }
                        }
                )

            
            //-------------Slide Sheet View------------------
            VStack{
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(width: 50, height: 4)
                    .foregroundColor(.gray)
                    .padding()
                
                Text("Signup")
                    .font(.title3Regular)
                    .fontWeight(.medium)
                    .padding()
                
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 100)
                    .foregroundColor(.primaryColor)
                    .padding()
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley")
                
                Button {} label: {
                    Text("Create Account")
                        .modifier(FillColorButtonViewModifier())
                }
                .buttonStyle(ButtonClickScaleEffectStyle())
                .padding(.top,16)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity,maxHeight:.infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            .offset(y:minHeightOffset)
            .offset(y:currentDragOffset)
            .offset(y:endingDragOffset)
            .gesture(
                DragGesture()
                    .onChanged{value in
                        let height = value.translation.height
                        if(height > -minHeightOffset){
                            withAnimation(.spring){
                                currentDragOffset = height
                            }
                        }
                    }
                    .onEnded{value in
                        withAnimation(.spring){
                            if currentDragOffset < -150{
                                endingDragOffset = -minHeightOffset
                                currentDragOffset = .zero
                            } else if (currentDragOffset>150){
                                endingDragOffset = .zero
                            }
                            currentDragOffset = .zero
                        }
                    }
            )
            
            
            
            .navigationBarWithBackButton(title: "DragGesture")
            .ignoresSafeArea(edges: .bottom)

        }
    }
    
    private func getScaleAmount() -> CGFloat{
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5)  * 0.5
    }
    
    
    func getRorationAmount()->Double{
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        return Double(percentage) * 10
    }
}

#Preview {
    NavigationStack{
        DragGestureUIView()
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color.primaryColor, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            
    }
}
