//
//  SkeletonView.swift
//  lampLightView
//
//  Created by Nishanth on 19/07/24.
//

import SwiftUI

struct SkeletonView: View {
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
            ForEach(0..<10, id: \.self){_ in
                ListDetailView()
                
                    
            }
        }.skeletonViewAnimation(timeDurattion: 1.0)
        
    }
}

#Preview {
    SkeletonView()
        .padding(.all)
}


struct ListDetailView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 15, content: {
            
            Circle()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading,spacing: 10, content: {
                
                Color.gray.opacity(0.5)
                    .frame(height: 25)
                
                Color.gray.opacity(0.5)
                    .frame(height: 25)
                
            })
        })
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 10))
    }
}




struct SkeletonViewModifier: ViewModifier{
    let timeDuration: Double
    
    @State private var isAnimation: Bool = false
    
    func body(content: Content) -> some View {
        content
            .opacity(isAnimation ? 0.3 : 1.0)
            .animation(.easeInOut(duration: timeDuration).repeatForever(autoreverses: false), value: isAnimation)
            .onAppear(perform: {
                self.isAnimation = true
            })
    }
    
}


extension View{
    
    func skeletonViewAnimation(timeDurattion: Double) -> some View{
        
        modifier(SkeletonViewModifier(timeDuration: timeDurattion))
    }
}



