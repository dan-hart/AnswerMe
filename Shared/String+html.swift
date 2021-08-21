//
//  String+html.swift
//  AnswerMe
//
//  Created by Dan Hart on 8/21/21.
//

import Foundation

extension String {
    var html: String {
        var finalString = ""
        for char in self {
            for scalar in String(char).unicodeScalars {
                finalString.append("&#\(scalar.value)")
            }
        }
        return finalString
    }
}
