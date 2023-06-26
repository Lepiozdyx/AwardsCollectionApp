//
//  MountainView.swift
//  AwardsCollectionApp
//
//  Created by Alex on 26.06.2023.
//

import SwiftUI

struct MountainView: View {
    var body: some View {
        
        ZStack {
            Circle()
                .foregroundColor(.orange)
                .frame(width: 150)
                .offset(x: 30, y: -40)
            
            GeometryReader { geometry in
                let width = geometry.size.width
                let hight = geometry.size.height
                let minSize = min(width, hight)
                let middle = minSize / 2
                
                Path { path in
                    path.move(to: CGPoint(x: middle, y: 0))
                    path.addLine(to: CGPoint(x: minSize, y: minSize))
                    path.addLine(to: CGPoint(x: 0, y: minSize))
                }
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.white, .cyan, .blue]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .scaleEffect(1)
            }
            
            let offsets = [50, 10, 0, -30, -70]
            
            ForEach(offsets, id: \.self) { offset in
                Image(systemName: "forward.fill")
                    .rotationEffect(.degrees(-90))
                    .offset(x: CGFloat(offset), y: 90)
            }
            .opacity(0.5)
        }
    }
}

struct LinesView_Previews: PreviewProvider {
    static var previews: some View {
        MountainView()
            .frame(width: 200, height: 200)
    }
}