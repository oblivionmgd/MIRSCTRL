//
//  SelectBall.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/11.
//

import SwiftUI
import FirebaseDatabase

extension Animation {
    static func ripple() -> Animation {
        Animation.spring(dampingFraction: 0.3)
            .speed(1.2)
    }
}

let darkRed = Color(red: 199 / 255, green: 91 / 255, blue: 87 / 255)
let backgroundColor = Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255)
let green = Color(red: 56 / 255, green: 91 / 255, blue: 91 / 255)
let black = Color(red: 40 / 255, green: 54 / 255, blue: 74 / 255)

struct SelectBall: View {
    var ref: DatabaseReference = Database.database().reference()
    
    @State var isProcessing = false
    @State var objectOpacity:Double  = 1

    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Circle()
                .fill(green)
                .frame(width: 700, height: 700, alignment: .bottom)
                .offset(y: 300)
                .scaleEffect(isProcessing ? 7 : 1)
                .animation(.ripple())
            VStack {
                Spacer().frame(width:1, height: 40)
                Text("Select Ball.")
                    .font(.system(size: 48, weight: .heavy))
                    .foregroundColor(black)
                    .opacity(objectOpacity)
                Text("Swipe to change ball")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(black)
                    .opacity(objectOpacity)
                BallTabView()
                    .frame(width:UIScreen.main.bounds.width)
                    .scaleEffect(isProcessing ? 0 : 1)
                    .opacity(objectOpacity)
                Button(action:{
                    self.ref.child("MIRS").child("machineStatus").setValue(["Status":"go"])
                    isProcessing.toggle()
                    withAnimation(.easeOut(duration: 0.5)){
                        self.objectOpacity = 0
                    }
                }){
                    Text("    START    ")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(backgroundColor)
                }
                .softButtonStyle(RoundedRectangle(cornerRadius: 36), mainColor: green, darkShadowColor: Color(red: 48 / 255, green: 78 / 255, blue: 78 / 255), lightShadowColor: Color(red: 64 / 255, green: 106 / 255, blue: 106 / 255), pressedEffect: .hard)
                .opacity(objectOpacity)
            }
            if isProcessing {
                Processing()
            }

        }
        .offset(y: -20)
    }
}

struct SelectBall_Previews: PreviewProvider {
    static var previews: some View {
        SelectBall()
    }
}
