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
    @State var isShowingNoResults = false
    @State var errorText = ""
    
    var body: some View {
        NavigationStack {
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
                
                if isShowingNoResults {
                    VStack {
                        Label("No Results", systemImage: "questionmark.circle")
                            .font(.title)
                            .foregroundColor(.secondary)
                            .padding()
                        Text(errorText)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
                
                Spacer()
                
                NavigationLink {
                    if let answer = answer {
                        UpdatedAnswerView(data: answer)
                    }
                } label: {
                    Text("Show Results")
                        .disabled(answer == nil)
                }
                
                Spacer()
                
                Label("Powered by DuckDuckGo", systemImage: "magnifyingglass")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding()
            }
            
            .navigationTitle("AnswerMe")
        }
    }
    
    func go(_ text: String) {
        Task {
            do {
                self.answer = try await DDGInstantAnswer.query(text)
                self.isShowingAnswerView = true
            } catch {
                errorText = "\(error)"
                isShowingNoResults = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
