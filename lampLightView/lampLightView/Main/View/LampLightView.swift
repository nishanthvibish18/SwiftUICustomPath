//
//  LampLightView.swift
//  lampLightView
//
//  Created by Nishanth on 17/07/24.
//

import SwiftUI

struct LampLightView: View {
    @State private var lightColorOpacity: Double = 0.0
    var body: some View {
        VStack(alignment: .center) {
            
            RoundedRectangle(cornerRadius: 3)
                .fill(Color.lightBackgroundGreyColor)
                .frame(width: 100, height: 15)
                .offset(x:-10)
            
            RoundedRectangle(cornerRadius: 2)
                .fill(LinearGradient(colors: [.lightBackgroundGreyColor], startPoint: .top, endPoint: .bottom))
                .frame(width: 18,height: 150)
                .offset(x: -10.0,y: -10)
            
            LampViewSahpe()
                .stroke(.black, style: StrokeStyle(lineWidth: 0.8, lineCap: .round,lineJoin: .round))
                .fill(LinearGradient(colors: [Color.lightBackgroundGreyColor,Color.secondary], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 200, height: 200)
            .offset(y: -20)
            
            LightShapeView()
                .stroke(.black, style: StrokeStyle(lineWidth: 0, lineCap: .round,lineJoin: .round))
                .fill(Color.yellowLightColor.opacity(lightColorOpacity))
                .frame(width: 280,height: .infinity)
                .offset(y: -30)
                .animation(.easeInOut(duration: 0.5), value: lightColorOpacity)
            
//            Spacer()
            
            HStack(alignment: .center,spacing: 20, content: {
                
                Button(action: {
                    lightColorOpacity = 1.0
                }, label: {
                   Image(systemName: "lightbulb.max.fill")
                })
                
                
                Button(action: {
                    lightColorOpacity = 0.5

                }, label: {
                   Image(systemName: "lightbulb.min.fill")
                })
                
                Button(action: {
                    lightColorOpacity = 0.0

                }, label: {
                    Image(systemName: "lightbulb.fill")
                    
                })
                
                
            })
            .font(.title)
            .fontWeight(.bold)
        }

    }
}

#Preview {
    LampLightView()
        .padding(.all)
        .preferredColorScheme(.dark)
}


struct LightShapeView: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + 60, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - 60, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        return path
    }
}

struct LampViewSahpe: Shape{
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX - 20, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + 15))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.midY - 20))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.maxY - 20))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - 20))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - 20))
        path.addLine(to: CGPoint(x: rect.minX + 15, y: rect.maxY - 20))
        path.addLine(to: CGPoint(x: rect.minX + 15, y: rect.midY - 20))
        path.addLine(to: CGPoint(x: rect.midX - 20, y: rect.minY + 15))
        path.closeSubpath()
        return path
    }
      
}



extension Color{
    static let yellowLightColor = Color("yellowLightColor")
    static let lightBackgroundGreyColor = Color("lightBackgroundcolor")
}
