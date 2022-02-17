//
//  ContentView.swift
//  UI-469
//
//  Created by nyannyan0328 on 2022/02/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        SplashScreen()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SplashScreen : View{
    
    @State var animation : [Bool] = Array(repeating: false, count: 2)
    
    var body: some View{
        
        ZStack{
            
            
                    ZStack{
            
                        Color.black
                        MatrixRainView()
                    }
                    .ignoresSafeArea()
                .opacity(animation[1] ? 1 : 0)
            
            
            
            if !animation[1]{
                
                Color("BG")
                
                    .mask {
                        Rectangle()
                       
                            .overlay {
                                
                                Image("p1")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 80, height: 80)
                                    .scaleEffect(animation[0] ? 50 : 1)
                                    .blendMode(.destinationOut)
                                  
                                
                            }
                        
                    }
                
            }
            
        }
        .ignoresSafeArea()
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                
                withAnimation(.easeOut(duration: 0.3).speed(0.3)){
                    
                    
                    animation[0] = true
                }
                
                withAnimation(.easeOut(duration: 1.5)){
                    
                    animation[1] = true
                }
                
                
            }
        }
    }
}


