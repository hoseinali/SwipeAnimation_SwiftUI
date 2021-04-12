//
//  Home.swift
//  SwipeAnimationSwiftUI
//
//  Created by Hossein Ali Alborzi on 4/13/21.
//

import SwiftUI


struct Home: View{
    @State var offset:CGSize = .zero
    @State var showHome = false

    var body: some View {
        
        ZStack {
            Image("gta-v").resizable(resizingMode: .stretch).ignoresSafeArea(.all)
                .clipShape(LiquidSwipe(offest: offset)).ignoresSafeArea()
                
                .overlay(
                    Image("key").font(.largeTitle).frame(width: 50, height: 50).contentShape(Rectangle()).gesture(DragGesture().onChanged({ (value) in
                        offset = value.translation
                        
                        withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)) {
                            offset = value.translation
                        }
                    }).onEnded({ (value) in
                      
                        withAnimation (.spring()) {
                            let screen = UIScreen.main.bounds
                            withAnimation(.spring()) {
                                
                                if -offset.width > screen.width / 2 {
                                    offset.width = -screen.height
                                    showHome.toggle()
                                    
                                } else {
                                    
                                    offset = .zero
                                }
                                
                            }
                        }
                    }))
                        
                    .offset(x: 5,y:105).opacity(offset == .zero ? 1: 0),alignment: .topTrailing
                    
            )
            
            if showHome {
                Image("hide").onTapGesture {
                    withAnimation(.spring()){
                        offset = .zero
                        showHome.toggle()
                    }
                }

            }

        }.background(Image("code").resizable()).ignoresSafeArea(.all)
    }
}

