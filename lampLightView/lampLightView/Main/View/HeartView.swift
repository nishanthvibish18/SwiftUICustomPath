//
//  HearView.swift
//  lampLightView
//
//  Created by Nishanth on 19/07/24.
//

import SwiftUI

struct HeartView: View {
    @State private var randomnumber: Int = Int.random(in: 5...15)
    @State private var isAnimate: Bool = false
    
  
    var body: some View {
       
        ZStack {
            ForEach(0...randomnumber, id: \.self) { _ in
                
                Circle()
                    .fill(LinearGradient(colors: [Color.cyan, Color.blue, Color.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: itemSize())
                    .position(x: itemPosition(), y: itemPosition())
                    .scaleEffect(isAnimate ? scaleEffects() : 1)
                    .onAppear {
                        withAnimation(.interpolatingSpring(stiffness: 0.05, damping: 0.5).repeatForever(autoreverses: true).speed(itemSpeed()).delay(slowspeed())) {
                            self.isAnimate.toggle()
                        }
                    }
            }

                
        }.frame(width: 250, height: 250)
    }
}
private func itemPosition() -> CGFloat{
    return CGFloat(Int.random(in: 0...250))
}

private func itemSize() -> CGFloat{
    return CGFloat(Int.random(in: 0...80))
}

private func scaleEffects() -> CGFloat{
    return CGFloat(Double.random(in: 0.5...2.0))
}

private func itemSpeed() -> Double{
    return Double.random(in: 0.5...2.0)
}

private func slowspeed() -> Double{
    return Double.random(in: 0...2)
}





#Preview {
    HeartView()
        .padding(.all)
        .preferredColorScheme(.light)
}




























