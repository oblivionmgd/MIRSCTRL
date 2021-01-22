//
//  SelectBall.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/11.
//

import SwiftUI
import FirebaseDatabase

//アニメーションの細かい設定を行う。
extension Animation {
    static func ripple() -> Animation {
        Animation.spring(dampingFraction: 0.3)
            .speed(1.2)
    }
}
//色の宣言
let darkRed = Color(red: 199 / 255, green: 91 / 255, blue: 87 / 255)
let backgroundColor = Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255)
let green = Color(red: 56 / 255, green: 91 / 255, blue: 91 / 255)
let black = Color(red: 40 / 255, green: 54 / 255, blue: 74 / 255)

struct SelectBall: View {
    var ref: DatabaseReference = Database.database().reference()
    @EnvironmentObject var startCollect: processStatus
    @State var isProcessing = false
    @State var objectOpacity:Double  = 1
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            // 背景の円。
            Circle()
                .fill(green)
                .frame(width: 700, height: 700, alignment: .bottom)
                .offset(y: 300)
                // isProcessingがTrueになると円が7倍のサイズになる。クソデカいね。
                .scaleEffect(isProcessing ? 7 : 1)
                //12行目のextension。ポヨンポヨンする。
                .animation(.ripple())
            VStack {
                Spacer().frame(width:1, height: 40)
                // タイトル
                Text("ボールを選択")
                    .font(Font.custom("NotoSansJP-Bold", size: 48))
                    .fontWeight(.bold)
                    .foregroundColor(black)
                    .opacity(objectOpacity)
                Text("スワイプでボールを変更")
                    .font(Font.custom("NotoSansJP-Bold", size: 18))
                    .foregroundColor(black)
                    .opacity(objectOpacity)
                // 各種ボールの表示。 BallTabView参照。
                BallTabView()
                    .frame(width:UIScreen.main.bounds.width)
                    .scaleEffect(isProcessing ? 0 : 1)
                    .opacity(objectOpacity)
                // Startボタン
                Button(action:{
                    //Databaseの書き換え
                    self.ref.child("MIRS").child("machineStatus").setValue(["Status":"go"])
                    isProcessing.toggle()
                    //不透明度を0にしてフェードアウトさせる。
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
                    .environmentObject(self.startCollect)
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
