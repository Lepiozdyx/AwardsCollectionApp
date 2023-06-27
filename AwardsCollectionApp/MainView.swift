//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

struct MainView: View {
    @State private var awardIsShowing = false
    @State private var cloudOffset: CGFloat = -150
    
    var body: some View {
        ZStack {
            Color(red: 0.8, green: 1, blue: 1)
                .ignoresSafeArea()
            
            VStack {
                Button(action: buttonAction) {
                    Text(awardIsShowing ? "Hide Award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .rotationEffect(.degrees(awardIsShowing ? 0 : 180))
                        .scaleEffect(awardIsShowing ? 2 : 1)
                }
                
                Spacer()
                
                if awardIsShowing {
                    MountainView()
                        .frame(width: 300, height: 300)
                        .transition(.customTransition)
                    
                    CloudView()
                        .frame(width: 110, height: 70)
                        .offset(x: cloudOffset, y: -150)
                        .animation(
                            .linear(duration: 5)
                            .repeatForever(autoreverses: false),
                            value: cloudOffset
                        )
                        .onAppear {
                            cloudOffset = 250
                        }
                        .onDisappear {
                            cloudOffset = -250
                        }
                    
                    CloudView()
                        .frame(width: 100, height: 60)
                        .offset(x: cloudOffset, y: -350)
                        .animation(
                            .linear(duration: 7)
                            .repeatForever(autoreverses: false),
                            value: cloudOffset
                        )
                        .onAppear {
                            cloudOffset = 250
                        }
                        .onDisappear {
                            cloudOffset = -250
                        }
                }
                
                Spacer()
            }
            .font(.headline)
            .padding()
        }
    }
    
    private func buttonAction() {
        withAnimation {
            awardIsShowing.toggle()
        }
    }
}

extension AnyTransition {
    static var customTransition: AnyTransition {
        let insertion = AnyTransition.opacity
            .combined(with: .scale)
        let removal = AnyTransition.opacity
            .combined(with: .scale)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
