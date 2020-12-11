//
//  SelectBall.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/11.
//

import SwiftUI

struct SelectBall: View {
    @State private var draftProfile = Profile.default
    let darkRed = Color(red: 199 / 255, green: 91 / 255, blue: 87 / 255)
    let backgroundColor = Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255)
    let green = Color(red: 56 / 255, green: 91 / 255, blue: 91 / 255)
    
    var body: some View {
        ZStack {
            backgroundColor
            Circle()
                .fill(green)
                .frame(width: 650, height: 650, alignment: .bottom)
                .offset(y: 300)
            VStack {
                Spacer().frame(height: 20)
                Text("Select Ball.")
                    .font(.system(size: 48, weight: .heavy))
                Text("Swipe to change ball")
                    .font(.system(size: 24, weight: .medium))
                BallTabView()
                    .frame(width:UIScreen.main.bounds.width)
                Button(action:{}){
                    ZStack{
                        Capsule()
                            .fill(darkRed)
                            .frame(width: 200, height: 50)
                        Text("START")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(backgroundColor)
                    }
                }
            }
        }
    }
}

struct SelectBall_Previews: PreviewProvider {
    static var previews: some View {
        SelectBall()
    }
}
