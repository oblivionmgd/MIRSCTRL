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
    let black = Color(red: 40 / 255, green: 54 / 255, blue: 74 / 255)
    
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
                    .foregroundColor(black)
                Text("Swipe to change ball")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(black)
                BallTabView()
                    .frame(width:UIScreen.main.bounds.width)
                Button(action:{}){
                    Text("    START    ")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(backgroundColor)
                }
                .softButtonStyle(RoundedRectangle(cornerRadius: 36), mainColor: green, darkShadowColor: Color(red: 48 / 255, green: 78 / 255, blue: 78 / 255), lightShadowColor: Color(red: 64 / 255, green: 106 / 255, blue: 106 / 255), pressedEffect: .hard)
            }
        }
    }
}

struct SelectBall_Previews: PreviewProvider {
    static var previews: some View {
        SelectBall()
    }
}
