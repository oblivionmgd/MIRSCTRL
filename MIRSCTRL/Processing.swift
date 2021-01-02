//
//  Processing.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/15.
//

import SwiftUI
import FirebaseDatabase

struct Processing: View {
    @EnvironmentObject var startCollect: processStatus
    @State var isLoading = false
    @State var objectOpacity: Double = 0
    
    var ref: DatabaseReference = Database.database().reference()
    
    let loadingRingSize: CGFloat = 300
    let loadingRingWidth: CGFloat = 25
    var body: some View {
        VStack {
            Spacer().frame(width:1, height: 25)
            Text("作業中...")
                .font(Font.custom("NotoSansJP-Bold", size: 54))
                .foregroundColor(backgroundColor)
            Spacer().frame(width: 1, height: 80)
            ZStack {
                Circle()
                    .fill(green)
                    .frame(width: loadingRingSize, height: loadingRingSize)
                    .softInnerShadow(Circle(), darkShadow: Color(red: 48 / 255, green: 78 / 255, blue: 78 / 255), lightShadow: Color(red: 64 / 255, green: 106 / 255, blue: 106 / 255), spread: 0.1)
                Circle()
                    .fill(green)
                    .frame(width: loadingRingSize - loadingRingWidth*2, height: loadingRingSize - loadingRingWidth*2)
                    .softOuterShadow(darkShadow: Color(red: 48 / 255, green: 78 / 255, blue: 78 / 255), lightShadow: Color(red: 64 / 255, green: 106 / 255, blue: 106 / 255))
                Circle()
                    .trim(from: 0.75, to: 1)
                    .stroke(backgroundColor, style: StrokeStyle(
                        lineWidth: loadingRingWidth,
                        lineCap: .round
                    ))
                    .frame(width: 275, height: 275)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
                Text("XX%")
                    .font(.system(size: 80, weight: .heavy))
                    .foregroundColor(backgroundColor)
            }
            Spacer().frame(width: 1, height: 125)
            Button (action: {
                self.startCollect.isRun.toggle()
                self.ref.child("MIRS").child("machineStatus").setValue(["Status": "stop"])
            }) {
                Text("     STOP     ")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(backgroundColor)
            }
            .softButtonStyle(RoundedRectangle(cornerRadius: 36), mainColor: green, darkShadowColor: Color(red: 48 / 255, green: 78 / 255, blue: 78 / 255), lightShadowColor: Color(red: 64 / 255, green: 106 / 255, blue: 106 / 255), pressedEffect: .hard)
        }
        .opacity(objectOpacity)
        .onAppear() {
            self.isLoading = true
            withAnimation (Animation.easeOut(duration: 0.5).delay(0.5)){
                self.objectOpacity = 1
            }
        }
    }
}

struct Processing_Previews: PreviewProvider {
    static var previews: some View {
        Processing()
    }
}
