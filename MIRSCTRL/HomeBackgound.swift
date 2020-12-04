//
//  HomeBackgound.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/04.
//

import SwiftUI

struct HomeBackgound: View {
    var body: some View {
        Image("MIRSHome")
            .resizable()
            .frame(height: 872, alignment: .topLeading)
            .overlay(Text("Welcome.")
                        .fontWeight(.heavy)
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(Color(red: 250, green: 247, blue: 237, opacity: 1.0))
                        .multilineTextAlignment(.leading)
                        .offset(x: -70,y: -350))
    }
}

struct HomeBackgound_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackgound()
    }
}
