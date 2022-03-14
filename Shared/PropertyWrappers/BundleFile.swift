//
//  BundleFile.swift
//  AnswerMe
//
//  Created by Dan Hart on 3/13/22.
//

import Foundation

@propertyWrapper struct BundleFile<T> {
    let name: String
    let type: String
    let fileManager: FileManager = .default
    let bundle: Bundle = .main
    let decoder: (Data) -> T?

    var wrappedValue: T? {
        guard let path = bundle.path(forResource: name, ofType: type) else {
            return nil
        }
        guard let data = fileManager.contents(atPath: path) else {
            return nil
        }
        return decoder(data)
    }
}
