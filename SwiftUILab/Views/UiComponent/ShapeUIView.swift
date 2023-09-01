//
//  ShapeUIView.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/9/23.
//

import SwiftUI

struct ShapeUIView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack(spacing: 15){
                
                //-----------Water Shape example-------------------------
                GeometryReader{proxy in
                    WaterShape()
                        .fill(LinearGradient(gradient: Gradient(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing))
                        .frame(width: proxy.size.width,height: proxy.size.height)
                }.frame(height: 150)
                
                
                //---------------- Rectangle Shape Example-------------------
                Group{
                    
                    HStack(spacing: 10){
                        //---------------- Fill Rectangle Shape Example-------------------
                        Rectangle()
                            .frame(width: 100,height: 100)
                            .foregroundColor(.primaryColor)
                        
                        //---------------- Rectangle With Border Shape Example-------------------
                        Rectangle()
                            .stroke(Color.primaryColor, lineWidth:2.0)
                            .frame(width: 100,height: 100)
                        
                        //---------------- Rectangle With Dash Border Shape Example-------------------
                        Rectangle()
                            .stroke(style: StrokeStyle(lineWidth: 2,lineCap: .round,dash: [5]))
                            .foregroundColor(.primaryColor)
                            .frame(width: 100,height: 100)
                            
                    }
                    
                    //---------------- Circle Shape Example-------------------
                    HStack(spacing: 10){
                        //---------------- Fill Cirle Shape Example-------------------
                        Circle()
                            .frame(width: 100,height: 100)
                            .foregroundColor(.primaryColor)
                        
                        //---------------- Circle With Border Shape Example-------------------
                        Circle()
                            .stroke(Color.primaryColor, lineWidth:2.0)
                            .frame(width: 100,height: 100)
                        
                        //---------------- Circle With Dash Border Shape Example-------------------
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 2,lineCap: .round,dash: [5]))
                            .foregroundColor(.primaryColor)
                            .frame(width: 100,height: 100)
                            
                    }
                }
                
                //-----------------Custom shape advance example--------------------
                Group{
                    HStack{
                        TriangleShape()
                            .fill(LinearGradient(gradient: Gradient(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 100,height: 100)
                        
                        TriangleShape()
                            .stroke(Color.primaryColor, lineWidth:2.0)
                            .frame(width: 100,height: 100)
                        
                        TriangleShape()
                            .stroke(style: StrokeStyle(lineWidth: 2,lineCap: .round,dash: [5]))
                            .foregroundColor(.primaryColor)
                            .frame(width: 100,height: 100)
                    }
                    
                    HStack{
                        DiamondShape()
                            .fill(LinearGradient(gradient: Gradient(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 100,height: 100)
                        
                        DiamondShape()
                            .stroke(Color.primaryColor, lineWidth:2.0)
                            .frame(width: 100,height: 100)
                        
                        DiamondShape()
                            .stroke(style: StrokeStyle(lineWidth: 2,lineCap: .round,dash: [5]))
                            .foregroundColor(.primaryColor)
                            .frame(width: 100,height: 100)
                    }
                }
                
                
                Group{
                    HStack{
                        AdvanceArc()
                            .fill(LinearGradient(gradient: Gradient(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 100, height: 100)
                        
                        AdvanceArc2()
                            .fill(LinearGradient(gradient: Gradient(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 100, height: 100)
                        
                        AdvanceArc3()
                            .fill(LinearGradient(gradient: Gradient(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 100, height: 100)
                    }
                }
                
            
                
               
                //------------------Arch With Shape Example----------------
                Group{
                    HStack{
                        ShapeWithArc()
                            .fill(Color.primaryColor)
                            .frame(width: 100, height: 100)
                        
                        ShapeWithArc1()
                            .fill(LinearGradient(gradient: Gradient(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 100, height: 100)
                    }
                }
                
                
            }.frame(maxWidth: .infinity)
        }
        .navigationBarWithBackButton(title: "Shapes")
    }
}


//----------Advance Custom shape Triangle--------------
struct TriangleShape : Shape{
    func path(in rect: CGRect) -> Path {
        Path{path in
            /*
             For a rectangele start point (0,0)
             x axis: minX means 0 or start point, midX means x axis middle point and maxX means end point of x axis
             y axis: minY means 0 or start point, midY means y axis middle point and maxY means end point of y axis
             */
            
            // move the cursor point reacangle top middle point
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            // add line reacangle bottom right corner
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

//----------Advance Custom shape Diamond--------------
struct DiamondShape : Shape{
    func path(in rect: CGRect) -> Path {
        Path{path in
            let horizontalOffset:CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horizontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

//----------Advance Arc Example------------
struct AdvanceArc : Shape{
    func path(in rect: CGRect) -> Path {
        Path{path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false
            )
        }
    }
}

struct AdvanceArc2 : Shape{
    func path(in rect: CGRect) -> Path {
        Path{path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: -20),
                endAngle: Angle(degrees: 20),
                clockwise: false
            )
        }
    }
}

struct AdvanceArc3 : Shape{
    func path(in rect: CGRect) -> Path {
        Path{path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: -20),
                endAngle: Angle(degrees: 20),
                clockwise: true
            )
        }
    }
}

//-------------Arch Shape Example Class-------------------
struct ShapeWithArc : Shape{
    func path(in rect: CGRect) -> Path {
        Path{path in
            //top left(0,0)
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            //top right(1,0)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            //middright(1,0.5)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midX))
        
            // bottm middle(0.5, 1)
            //path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midX),
                radius: rect.height/2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            
            //mid left (0,0.5)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        }
    }
}

struct ShapeWithArc1 : Shape{
    func path(in rect: CGRect) -> Path {
        Path{path in
            //top left(0,0)
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            //top right(1,0)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            //middright(1,0.5)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midX))
        
            // bottm middle(0.5, 1)
            //path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midX - 45),
                radius: rect.height/2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            
            //mid left (0,0.5)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        }
    }
}

//-------------Water Shape Example--------------------
struct WaterShape : Shape{
    func path(in rect: CGRect) -> Path {
        Path{path in
            
            //start point
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addQuadCurve(
                
                //end point
                to: CGPoint(x: rect.midX, y: rect.midY),
                
                // control point, add curve half of height
                control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.25)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.75)
            )
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        }
    }
}

struct ShapeUIView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeUIView()
    }
}











