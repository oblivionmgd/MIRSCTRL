//
//  BallTabView.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/11.
//

import SwiftUI
import FirebaseDatabase


struct Ball: Identifiable {
    var id: Int
    var ballImageName: String
    var ballName: String
    var ballDescription: String
}


struct BallTabView: View {
    var ref: DatabaseReference = Database.database().reference()
    
    @State private var selected = 0
    
    let balls: [Ball] = [
        Ball(id: 0, ballImageName: "tennisballimg", ballName: "Tennis Ball", ballDescription: "Storage limit: \n About 8 ~ 10 balls"),
        Ball(id: 1, ballImageName: "pingpongimg", ballName: "Table Tennis Ball", ballDescription: "Storage limit: \n About 50 ~ 70 balls")
    ]
    
    
    var body: some View{
        TabView {
            VStack {
                Image("tennisballimg")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                Text("Tennis Ball")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                Text("Storage limit: \n About 8~10 balls")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                    .multilineTextAlignment(.leading)
            }
            .offset(y: -20)
            .onAppear() {
                self.ref.child("MIRS").child("selectedBall").setValue(["ball":"tennisball"])
            }
            VStack {
                Image("pingpongimg")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                Text("Table Tennis Ball")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                Text("Storage limit: \n About 50~70 balls")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color(red: 237 / 255, green: 221 / 255, blue: 199 / 255))
                    .multilineTextAlignment(.leading)
            }
            .offset(y: -20)
            .onAppear() {
                self.ref.child("MIRS").child("selectedBall").setValue(["ball":"pingpong"])
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct BallTabView_Previews: PreviewProvider {
    static var previews: some View {
        BallTabView()
    }
}
