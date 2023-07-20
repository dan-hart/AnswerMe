//
//  AnswerableText.swift
//  AnswerMe
//
//  Created by Dan Hart on 7/20/23.
//

import SwiftUI
import DDGInstantAnswer

struct AnswerableText: View {
    var value: String
    @State var answer: Answer?
    
    var body: some View {
        Group {
            if let answer {
                NavigationLink {
                    UpdatedAnswerView(data: answer)
                } label: {
                    Label(value, image: "info.circle")
                }
            } else {
                Text(value)
            }
        }
            .onAppear {
                Task {
                    self.answer = await value.instantAnswer
                }
            }
    }
}

struct AnswerableText_Previews: PreviewProvider {
    static var previews: some View {
        AnswerableText(value: "New York City")
    }
}
