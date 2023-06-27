//
//  MountainView.swift
//  AwardsCollectionApp
//
//  Created by Alex on 26.06.2023.
//

import SwiftUI

struct MountainView: View {
    var body: some View {
        
        GeometryReader { geometry in
            let width = geometry.size.width
            let hight = geometry.size.height
            
            ZStack {
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: width * 0.8)
                    .offset(x: width * 0.25, y: -hight * 0.2)
                    .shadow(color: .red, radius: 40)
                    .scaleEffect(0.8)
                
                Path { path in
                    path.move(to: CGPoint(x: width * 0.5, y: 0))
                    path.addLine(to: CGPoint(x: width, y: hight))
                    path.addLine(to: CGPoint(x: 0, y: hight))
                }
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.white, .cyan, .blue]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(color: .black, radius: 10)
                .scaleEffect(0.9)
                
                Path { path in
                    path.move(to: CGPoint(x: width * 0.5, y: 0))
                    path.addLine(to: CGPoint(x: width, y: hight))
                    path.addLine(to: CGPoint(x: 0, y: hight))
                }
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.mint, .blue]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .scaleEffect(0.5)
                .offset(x: -width * 0.25, y: hight * 0.2)
                .shadow(color: .black, radius: 10)
                
                let offsets = [
                    width * 0.25,
                    width * 0.05,
                    0,
                    -width * 0.1,
                    -width * 0.25
                ]
                
                ForEach(offsets, id: \.self) { offset in
                    Image(systemName: "forward.fill")
                        .rotationEffect(.degrees(-90))
                        .offset(x: CGFloat(offset), y: hight * 0.45)
                }
                .opacity(0.5)
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: width * 0.4, height: hight * 0.25)
                    .offset(x: width * 0.3, y: -hight * 0.1)
                    .opacity(0.8)
            }
        }
    }
}

struct LinesView_Previews: PreviewProvider {
    static var previews: some View {
        MountainView()
            .frame(width: 200, height: 200)
    }
}
