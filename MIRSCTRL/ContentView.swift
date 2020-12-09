//
//  ContentView.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/02.
//

import SwiftUI
import Neumorphic

struct ContentView: View {
    
    var body: some View {
        ZStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            HomeBackgound()
            VStack {
                Spacer().frame(height: 500)
                neumorphismButton()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
