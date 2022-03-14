//
//  RelatedTopicsView.swift
//  AnswerMe
//
//  Created by Dan Hart on 3/13/22.
//

import SwiftUI
import DDGInstantAnswer

struct RelatedTopicsView: View {
    @Binding var answer: Answer
    
    @State var isLoading: Bool = true
    @State var relatedTopicAnswers: [Answer] = []
    
    var body: some View {
        List {
            if relatedTopicAnswers.isEmpty, !isLoading {
                ForEach(answer.relatedTopics ?? [], id: \.firstURL) { topic in
                    if let url = URL(string: topic.firstURL ?? "") {
                        Link(topic.text ?? "-", destination: url)
                    }
                }
            } else {
                ForEach(relatedTopicAnswers, id: \.abstractURL) { answer in
                    NavigationLink(answer.heading ?? "-", destination: AnswerView(answer: answer))
                }
            }
        }
        .onAppear {
            for topic in answer.relatedTopics ?? [] {
                Task {
                    if let answer = try? await DDGInstantAnswer.query(topic.text ?? "") {
                        relatedTopicAnswers.append(answer)
                    }
                }
            }
            isLoading = false
        }
        
        .navigationTitle("Related Topics")
    }
}

struct RelatedTopicsView_Previews: PreviewProvider {
    @BundleFile(name: "ElonMusk", type: "json", decoder: { data in
        Answer(from: data)
    })
    static var elonMusk: Answer?
    
    static var previews: some View {
        NavigationView {
            RelatedTopicsView(answer: .constant(elonMusk!))
        }
    }
}
