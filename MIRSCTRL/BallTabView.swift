//
//  BallTabView.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/11.
//

import SwiftUI

struct BallTabView: View {
    var body: some View {
        ScrollView {
            HStack{
                PageView()
            }
        }
    }
}

struct BallTabView_Previews: PreviewProvider {
    static var previews: some View {
        BallTabView()
    }
}

struct PageView: View {
    var body: some View{
        TabView{
            VStack {
                Image("tennisballimg")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width*1.2, height: UIScreen.main.bounds.width*1.2)
                Text("Tennis ball")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                    .offset(y: -75)
                Text("Storage limit: \n About 8 ~ 10 balls")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                    .multilineTextAlignment(.leading)
                    .offset(y: -75)
            }
            VStack {
                Image("pingpongimg")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width*1.2, height: UIScreen.main.bounds.width*1.2)
                Text("Table tennis ball")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                    .offset(y: -75)
                Text("Storage limit: \n About 50 ~ 70 balls")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                    .multilineTextAlignment(.leading)
                    .offset(y: -75)
            }
        }
        .aspectRatio(contentMode: .fit)
        .tabViewStyle(PageTabViewStyle())
    }
}
