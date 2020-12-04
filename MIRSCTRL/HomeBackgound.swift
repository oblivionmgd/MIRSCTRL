//
//  HomeBackgound.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/04.
//

import SwiftUI

struct HomeBackgound: View {
    var body: some View {
        Image("MIRSHome")
            .resizable()
            .frame(height: 920)
    }
}

struct HomeBackgound_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackgound()
    }
}
