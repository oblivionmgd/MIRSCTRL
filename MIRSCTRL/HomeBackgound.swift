//
//  HomeBackgound.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/04.
//

import SwiftUI

struct HomeBackgound: View {
    var body: some View {
        ZStack {
            Image("MIRSHome")
                .resizable()
                .frame(height: UIScreen.main.bounds.height)
                .edgesIgnoringSafeArea(.all)
            GeometryReader<AnyView> { geometry in
                if geometry.size.width == 375 { // welcome message for ipxs & ip11pro & ip12mini
                    return AnyView(
                        Text("Welcome.")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .bold))
                            .offset(x: 20, y: 40)
                    )
                }
                else if geometry.size.width == 390 { // welcome message for ip12 & ip12pro
                    return AnyView(
                            Text("Welcome.")
                                .foregroundColor(.white)
                                .font(.system(size: 40, weight: .bold))
                                .offset(x: 20, y: 45)
                    )
                }
                else if geometry.size.width == 414 { // welcome message for ip11 & ip11promax
                    return AnyView(
                            Text("Welcome.")
                                .foregroundColor(.white)
                                .font(.system(size: 45, weight: .bold))
                                .offset(x: 20, y: 45)
                    )
                }
                else if geometry.size.width == 428 { // welcome message for ip12promax
                    return AnyView(
                            Text("Welcome.")
                                .foregroundColor(.white)
                                .font(.system(size: 45, weight: .bold))
                                .offset(x: 25, y: 45)
                    )
                }

                else { //いい加減にしろ
                    return AnyView(
                            Text("Welcome.")
                                .foregroundColor(.white)
                                .font(.system(size: 36, weight: .bold))
                    )
                }
            }
        }
    }
}

struct HomeBackgound_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackgound()
    }
}
