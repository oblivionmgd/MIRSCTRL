//
//  Home.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/11.
//

import SwiftUI

class processStatus: ObservableObject {
    @Published var isRun: Bool = false
}
struct Home: View {
    @EnvironmentObject var startCollect: processStatus
    
    let darkRed = Color(red: 199 / 255, green: 91 / 255, blue: 87 / 255)
    let backgroundColor = Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255)
    
    var body: some View {
        ZStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            HomeBackgound()
            VStack {
                Spacer().frame(height: 500)
                Button(action:{
                    self.startCollect.isRun.toggle()
                }) {
                    VStack {
                        Text("あつめる")
                            .font(Font.custom("NotoSansJP-Bold", size: 18))
                            .foregroundColor(darkRed)
                        Text("Collect")
                            .font(.system(size: 36, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(darkRed)
                    }
                }
                .softButtonStyle(Circle(), padding: 60, mainColor: backgroundColor, darkShadowColor: Color(red: 204 / 255, green: 187 / 255, blue: 170 / 255), lightShadowColor: Color(red: 1, green: 1, blue: 1, opacity: 0.4), pressedEffect: .hard)
                .frame(width: 250, height: 250)
            }
            .sheet(isPresented: self.$startCollect.isRun) {
                SelectBall()
                    .environmentObject(startCollect)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(processStatus())
    }
}
