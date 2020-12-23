//
//  ContentView.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/02.
//

import SwiftUI
import Neumorphic

struct ContentView: View {
    var body: some View {
        Home()
            .environmentObject(processStatus())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
