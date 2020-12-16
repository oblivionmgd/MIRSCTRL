//
//  BallTabView.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/11.
//

import SwiftUI

struct Ball: Identifiable {
    var id: Int
    var ballImageName: String
    var ballName: String
    var ballDescription: String
}

struct BallTabView: View {
    
    let balls: [Ball] = [
        Ball(id: 0, ballImageName: "tennisballimg", ballName: "Tennis Ball", ballDescription: "Storage limit: \n About 8 ~ 10 balls"),
        Ball(id: 1, ballImageName: "pingpongimg", ballName: "Table Tennis Ball", ballDescription: "Storage limit: \n About 50 ~ 70 balls")
    ]
    
    
    var body: some View{
        TabView{
            ForEach(balls) { ball in
                VStack {
                    Image(ball.ballImageName)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    Text(ball.ballName)
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))

                    Text(ball.ballDescription)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                        .multilineTextAlignment(.leading)
                }
                .offset(y: -20)
            }
        }
//        .aspectRatio(contentMode: .fit)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct BallTabView_Previews: PreviewProvider {
    static var previews: some View {
        BallTabView()
    }
}
