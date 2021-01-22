//
//  ContentView.swift
//  MIRSCTRL
//
//  Created by 中村伸哉 on 2020/12/02.
//

import SwiftUI
// Neumorphic: ボタンなどのUIの装飾
import Neumorphic

struct ContentView: View {
    var body: some View {
        Home()
            //モーダルに使う用の変数、なんかこれContentView.swiftから渡さないとエラーが出る。
            .environmentObject(processStatus())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
