//
//  ContentView.swift
//  SwiftUI_ProgressView_TUT
//
//  Created by 김선중 on 2021/02/07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("다운로드중...")
                .padding(.leading, 20)
            ProgressView(value: downloadAmount, total: 100)
                .padding()
        } //VStack 밖에서 호출
        .progressViewStyle(DarkBlueShadowProgressViewStyle())
        .onReceive(timer) { _ in
            //만약 downloadAmount가 100보다 작다면 실행
            //total값 보다 작아야함
            if downloadAmount < 100 {
                downloadAmount += 5
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//progressViewStyle
struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}
