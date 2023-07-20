//
//  UpdatedAnswerView.swift
//  AnswerMe (iOS)
//
//  Created by Dan Hart on 7/20/23.
//

import SwiftUI
import DDGInstantAnswer
import UIKit

struct UpdatedAnswerView: View {
    var data: Answer
    
    @State var answer: Answer?
    @State var isShowingAnswerView: Bool = false
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    if let url = URL(string: "https://www.duckduckgo.com\(data.image ?? "")") {
                        HStack {
                            Spacer()
                            AsyncImage(url: url,
                                       content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .aspectRatio(CGFloat(data.imageWidth ?? 1) / CGFloat(data.imageHeight ?? 1), contentMode: .fit)
                            },
                                       placeholder: {
                                Rectangle()
                            })
                            .cornerRadius(16)
                            .padding()
                            Spacer()
                        }
                    }
                    
                    if let abstract = data.abstract {
                        Text(abstract)
                            .font(.body)
                            .padding()
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    if let infoboxContent = data.infobox?.content {
                        ForEach(infoboxContent, id: \.label) { content in
                            if let label = content.label, let value = content.value?.description, !label.isEmpty, !value.isEmpty, !(content.value?.isValueClass ?? true) {
                                HStack(alignment: .top) {
                                    Text(label)
                                        .font(.headline)
                                        .bold()
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                    
                                    AnswerableText(value: value)
                                        .multilineTextAlignment(.trailing)
                                }
                                .padding(.horizontal)
                                Divider()
                                    .padding(.horizontal)
                            }
                        }
                    }
                    
                    if let urlString = data.abstractURL, let url = URL(string: urlString) {
                        Button(action: {
                            UIApplication.shared.open(url)
                        }) {
                            Text("Read more on Wikipedia")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .padding()
                        }
                    }
                }
        }
            .navigationTitle(data.heading ?? "")
    }
}

struct UpdatedAnswerView_Previews: PreviewProvider {
    @BundleFile(name: "NewYorkCity", type: "json", decoder: { data in
        Answer(from: data)
    })
    static var newYorkCity: Answer?
    
    static var previews: some View {
        UpdatedAnswerView(data: newYorkCity!)
    }
}
