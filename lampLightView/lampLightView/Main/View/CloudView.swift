//
//  CloudView.swift
//  lampLightView
//
//  Created by Nishanth on 20/07/24.
//

import SwiftUI

struct CloudView: View {
    

    var body: some View {
        VStack {
            
           CloudMovingView()
            
            
            
        }
    }
    
    
   
    
    
}

#Preview {
    CloudView()
        .padding(EdgeInsets(top: 50, leading: 20, bottom: 50, trailing: 20))
}

struct ExtractedView: View {
    @State private var isAnimate:Bool = false
    var body: some View {
        ZStack {
            Circle().stroke(Color.blue.opacity(0.8),lineWidth: 40).frame(width: 240,height: 240)
            Circle().stroke(Color.blue.opacity(0.5),lineWidth: 80).frame(width: 240,height: 240)
        }
        .blur(radius: isAnimate ? 1.0 : 0.0)
        .opacity(isAnimate ? 1.0 : 0.0)
        .scaleEffect(isAnimate ? 1.0 : 0.5)
        .offset(y: isAnimate ? -150 : 400)
        .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true).speed(0.2).delay(1.0),value: isAnimate)
        .onAppear {
            self.isAnimate.toggle()
        }
    }
}


//MARK: Water Wave View
struct RainViewWave: View {
    @State private var isAnimate:Bool = false

    var body: some View {
        ZStack
        {
            Circle().fill(Color.blue.opacity(0.5)).frame(width: 240,height: 240)
            Circle().stroke(Color.blue.opacity(0.3),lineWidth: 80).frame(width: 240,height: 240)
                .blur(radius: isAnimate ? 0.4 : 0.0)
                .opacity(isAnimate ? 0.4 : 0.0)
                .scaleEffect(isAnimate ? 1.0 : 0.5)
        }
        .rotation3DEffect(
            Angle(degrees: 75),axis: (x: 1.0, y: 0.0, z: 0.0)
        )
        .animation(.spring(duration: 0.9).repeatForever(autoreverses: false).speed(0.2).delay(1.0),value: isAnimate)
        .onAppear {
            self.isAnimate.toggle()
        }
    }
}





struct cloudShape: Shape{
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: 50, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
     

        
        return path
    }
}

struct CloudMovingView: View {
    @State private var isAnimate:Bool = false
    @State private var randomNumber: Int = Int.random(in: 2...5)
    @State private var randomNumbers:Int = Int.random(in: 1...20)

    var body: some View {
        VStack {
            HStack {
                ForEach(0...randomNumber,id: \.self) { item in
                    ZStack{
                        cloudShape()
                            .fill(Color.gray.opacity(0.8))
                            .frame(width: 200, height: 100)
                            .offset(y: -40)
                        Capsule()
                            .fill(Color.gray.opacity(0.8))
                            .frame(width: 200,height: 80)
                        ForEach(0...randomNumbers, id: \.self) { item in
                            ZStack{
                                RainDropShape()
                                    .rotation(Angle(degrees: 180))
                                    .fill(Color.blue.opacity(0.7))
                                    .frame(width: 25,height: 25)
                                    .opacity(isAnimate ? 1.0 : 0.0)
                                    .offset(x: customOffset(),y: isAnimate ? customOffsetYPosition() : -20)
                                    .blur(radius: isAnimate ? 1.0 : 0.0)
                            }
                        }
                    }
                }
                .offset(x: isAnimate ? 200 : -100)
               
            }
            
               
        Spacer()
        }
        .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).speed(0.2).delay(0.1),value: isAnimate)
        .onAppear(perform: {
            self.isAnimate.toggle()
        })
    }
    
    private func customOffset() -> CGFloat{
        return CGFloat(Int.random(in: -130...130))
    }
    private func customOffsetYPosition() -> CGFloat{
        return CGFloat(Int.random(in: 10...300))
    }
    
    private func customSize() -> CGFloat{
        return CGFloat(Int.random(in: 25...28))
    }
}







//MARK: Rain Drop Shape
struct RainDropShape: Shape
{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY), control: CGPoint(x: rect.minX, y: rect.minY))

        return path
    }
}
