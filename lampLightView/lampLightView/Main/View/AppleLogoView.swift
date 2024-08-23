//
//  AppleLogoView.swift
//  lampLightView
//
//  Created by Nishanth on 18/07/24.
//

import SwiftUI

struct AppleLogoView: View {
    @State private var isAnimationEffect:Bool = false

    var body: some View {
        VStack(alignment: .center) {

            VStack {
                ZStack(alignment: .center) {
                   
                        
                    
                    
                    FlatViewShape()
                        .fill(Color.black).offset(x: isAnimationEffect ? 5.0 : 0.0,y: isAnimationEffect ? 100 : 0.0)
                    
                    heartShapeView()
                        .fill(Color.red)
                    
                }
                .frame(width: 200, height: 200)
                
                

                Text("My Favourite Car Hyundai Creta 🏎️")
                    .foregroundStyle(Color.black)
                    .fontWeight(isAnimationEffect ? .semibold : .light)
                    .font(isAnimationEffect ? .title2 : .title3)
                    .offset(y: isAnimationEffect ? 130 : 0.0)
                    
            }
                .blur(radius: isAnimationEffect ? 1.0 : 0.0)
                .scaleEffect(isAnimationEffect ? 1.0 : 0.5)
                .opacity(isAnimationEffect ? 1.0 : 0.0)
                .animation(.easeInOut(duration: 3.5).repeatForever(), value: isAnimationEffect)
                .onAppear(perform: {
                    self.isAnimationEffect.toggle()
            })

            
            
            
            
        }
        
        
        
    }
}

#Preview {
    AppleLogoView()
        .padding(.all)
}


struct FlatViewShape: Shape
{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - 40, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX + 40, y: rect.midY))
        path.closeSubpath()
        
//                path.move(to: CGPoint(x: rect.midX, y: rect.midY))
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.size.height / 2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)

        return path
    }
}


struct diamondShape: Shape
{
    func path(in rect: CGRect) -> Path {
        let frameOffset = rect.width * 0.2
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - frameOffset, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX + frameOffset, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}



struct heartShapeView: Shape{
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + 8, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY), control: CGPoint(x: rect.width * 0.25, y: -rect.height * 0.30))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 10, y: rect.minY), control: CGPoint(x: rect.width * 0.75, y: -rect.height * 0.30))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x: rect.maxX + 29, y: rect.midY - 10))
        path.addQuadCurve(to: CGPoint(x: rect.minX + 8, y: rect.minY), control: CGPoint(x: rect.minX - 29, y: rect.midY))
      
        
        return path
    }
}
