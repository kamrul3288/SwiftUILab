//
//  SliderUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 26/9/23.
//

import SwiftUI

struct SliderUIView: View {
    
    @State var offset:CGFloat = 0.0
    @State var sliderValue = 1.0
    private let sliderRange: ClosedRange<Double> = 1...100
    @State private var speed = 50.0
    
    
    var body: some View {
        VStack(alignment:.leading){
            
            
            Text("DragGesture Slider: \(sliderValue, specifier: "%.1f")")
            GeometryReader{proxy in
                ZStack(alignment:Alignment(horizontal: .leading, vertical: .center)){
                    
                    Capsule()
                        .fill(.blue.opacity(0.25))
                    
                    Capsule()
                        .fill(.blue.opacity(0.65))
                        .frame(width: offset+30)
                    
                    Circle()
                        .fill(.blue)
                        .frame(width: 30,height: 30)
                        .offset(x:offset)
                        .gesture(DragGesture(minimumDistance: 0).onChanged({ v in
                            let trackingWidth = v.location.x
                            let sliderWidth = proxy.size.width - 30
                            
                            if trackingWidth >= 0 && trackingWidth <= sliderWidth{
                                offset = trackingWidth
                                let valueRange = sliderRange.upperBound - sliderRange.lowerBound
                                let valuePerPoint = valueRange / sliderWidth
                                let newValue = sliderRange.lowerBound + offset * valuePerPoint
                                sliderValue = newValue.rounded()
                            }
                        }))
                }
            }
            .frame(height: 30)
            
            Slider(
                value: $speed,
                in: 0...100
            )
            
            Spacer()
            
        }
        .padding()
        .navigationBarWithBackButton(title: "Slider")
    }
}


#Preview {
    SliderUIView()
}
