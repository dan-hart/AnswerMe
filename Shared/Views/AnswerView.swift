//
//  AnswerView.swift
//  AnswerMe
//
//  Created by Dan Hart on 3/13/22.
//

import SwiftUI
import DDGInstantAnswer

struct AnswerView: View {
    @State var answer: Answer
    
    var body: some View {
        List {
            if let url = URL(string: "https://www.duckduckgo.com\(answer.image ?? "")") {
                HStack {
                    Spacer()
                    AsyncImage(url: url,
                               content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 500, maxHeight: 500)
                    },
                               placeholder: {
                        Rectangle()
                    })
                        .padding()
                    Spacer()
                }
            }
            
            Section("Abstract") {
                Text(answer.abstract ?? "-")
            }
            
            Section("Source") {
                if let url = URL(string: answer.abstractURL ?? "") {
                    Link(answer.abstractSource ?? "-", destination: url)
                } else {
                    Text(answer.abstractSource ?? "-")
                }
            }
            
            Section("Entity") {
                Text(answer.entity ?? "-")
            }
            
            Section("More") {
                NavigationLink("Related Topics", destination: RelatedTopicsView(answer: $answer))
            }
        }
        
        .navigationTitle(answer.heading ?? "")
    }
}

struct AnswerView_Previews: PreviewProvider {
    @BundleFile(name: "NewYorkCity", type: "json", decoder: { data in
        Answer(from: data)
    })
    static var newYorkCity: Answer?
    
    static var previews: some View {
        NavigationView {
            AnswerView(answer: newYorkCity!)
        }
    }
}
