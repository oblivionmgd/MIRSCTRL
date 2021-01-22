//
//  BallTabView.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/11.
//

import SwiftUI
import FirebaseDatabase


struct BallTabView: View {
    var ref: DatabaseReference = Database.database().reference()
    
    @State private var selected = 0
    
    var body: some View{
        //タブビュー(横にスライドするやつ)
        TabView {
            //テニスボールの画像とか説明とか
            VStack {
                Image("tennisballimg")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.width*0.8)
                Text("テニスボール")
                    .font( Font.custom("NotoSansJP-Bold", size: 36))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                Text("ボール回収上限: \n 約8~10個")
                    .font(Font.custom("NotoSansJP-Bold", size: 12))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                    .multilineTextAlignment(.leading)
            }
            .offset(y: -20)
            //タブビューで描画した瞬間にDatabaseの値を変更する
            .onAppear() {
                self.ref.child("MIRS").child("selectedBall").setValue(["ball":"tennisball"])
            }
            // テニスボールの画像とか説明とか
            VStack {
                Image("pingpongimg")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                Text("ピンポン球")
                    .font(Font.custom("NotoSansJP-Bold", size: 36))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                    .offset(y: -35)
                Text("ボール回収上限数: \n 約50~70個")
                    .font(Font.custom("NotoSansJP-Bold", size: 12))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                    .multilineTextAlignment(.leading)
                    .offset(y: -35)
            }
            .offset(y: -20)
            //タブビューで描画した瞬間にDatabaseの値を変更する
            .onAppear() {
                self.ref.child("MIRS").child("selectedBall").setValue(["ball":"pingpong"])
            }
        }
        .tabViewStyle(PageTabViewStyle()) //横スクタブビューにするやつ(たぶんiOS14.0~)
    }
}

struct BallTabView_Previews: PreviewProvider {
    static var previews: some View {
        BallTabView()
    }
}
