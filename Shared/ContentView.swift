//
//  ContentView.swift
//  Shared
//
//  Created by Dan Hart on 8/21/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var eightBall = EightBall()
    @State var queryText: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Eight Ball")
                .font(.title)
            TextField("What would you like to know more about?", text: $queryText, onEditingChanged: { didChange in
            }, onCommit: {
                eightBall.shakeWithText = queryText
            })
            .disableAutocorrection(true)
            .border(Color.gray)
            .multilineTextAlignment(.center)
            Button("Go") {
                eightBall.shakeWithText = queryText
            }
            Spacer()
            Text(eightBall.abstract ?? "")
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
