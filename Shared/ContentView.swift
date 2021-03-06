//
//  ContentView.swift
//  Shared
//
//  Created by Dan Hart on 8/21/21.
//

import SwiftUI
import DDGInstantAnswer

struct ContentView: View {
    @State var queryText: String = ""
    @State var answer: Answer?
    @State var isShowingAnswerView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("What would you like to know more about?", text: $queryText, onEditingChanged: { didChange in
                }, onCommit: {
                    go(queryText)
                })
                .disableAutocorrection(true)
                .padding()
                .multilineTextAlignment(.center)
                
                Button("Search") {
                    go(queryText)
                }
                Spacer()
                
                NavigationLink(isActive: $isShowingAnswerView) {
                    if let answer = answer {
                        AnswerView(answer: answer)
                    }
                } label: {
                    Text("Show Results")
                        .disabled(answer == nil)
                }
                Spacer()
            }
            
            .navigationTitle("AnswerMe")
        }
    }
    
    func go(_ text: String) {
        Task {
            if let answer = try? await DDGInstantAnswer.query(text) {
                self.answer = answer
                self.isShowingAnswerView = true
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
