// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let unknownAnswer = try UnknownAnswer(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.unknownAnswerTask(with: url) { unknownAnswer, response, error in
//     if let unknownAnswer = unknownAnswer {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - UnknownAnswer
struct UnknownAnswer: Codable {
    var abstract, abstractSource, abstractText: String?
    var abstractURL: String?
    var answer, answerType, definition, definitionSource: String?
    var definitionURL, entity, heading, image: String?
    var imageHeight, imageIsLogo, imageWidth: Int?
    var infobox, redirect: String?
    var relatedTopics: [RelatedTopic]?
    var results: [JSONAny]?
    var type: String?
    var meta: Meta?

    enum CodingKeys: String, CodingKey {
        case abstract = "Abstract"
        case abstractSource = "AbstractSource"
        case abstractText = "AbstractText"
        case abstractURL = "AbstractURL"
        case answer = "Answer"
        case answerType = "AnswerType"
        case definition = "Definition"
        case definitionSource = "DefinitionSource"
        case definitionURL = "DefinitionURL"
        case entity = "Entity"
        case heading = "Heading"
        case image = "Image"
        case imageHeight = "ImageHeight"
        case imageIsLogo = "ImageIsLogo"
        case imageWidth = "ImageWidth"
        case infobox = "Infobox"
        case redirect = "Redirect"
        case relatedTopics = "RelatedTopics"
        case results = "Results"
        case type = "Type"
        case meta
    }
}

// MARK: UnknownAnswer convenience initializers and mutators

extension UnknownAnswer {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(UnknownAnswer.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        abstract: String?? = nil,
        abstractSource: String?? = nil,
        abstractText: String?? = nil,
        abstractURL: String?? = nil,
        answer: String?? = nil,
        answerType: String?? = nil,
        definition: String?? = nil,
        definitionSource: String?? = nil,
        definitionURL: String?? = nil,
        entity: String?? = nil,
        heading: String?? = nil,
        image: String?? = nil,
        imageHeight: Int?? = nil,
        imageIsLogo: Int?? = nil,
        imageWidth: Int?? = nil,
        infobox: String?? = nil,
        redirect: String?? = nil,
        relatedTopics: [RelatedTopic]?? = nil,
        results: [JSONAny]?? = nil,
        type: String?? = nil,
        meta: Meta?? = nil
    ) -> UnknownAnswer {
        return UnknownAnswer(
            abstract: abstract ?? self.abstract,
            abstractSource: abstractSource ?? self.abstractSource,
            abstractText: abstractText ?? self.abstractText,
            abstractURL: abstractURL ?? self.abstractURL,
            answer: answer ?? self.answer,
            answerType: answerType ?? self.answerType,
            definition: definition ?? self.definition,
            definitionSource: definitionSource ?? self.definitionSource,
            definitionURL: definitionURL ?? self.definitionURL,
            entity: entity ?? self.entity,
            heading: heading ?? self.heading,
            image: image ?? self.image,
            imageHeight: imageHeight ?? self.imageHeight,
            imageIsLogo: imageIsLogo ?? self.imageIsLogo,
            imageWidth: imageWidth ?? self.imageWidth,
            infobox: infobox ?? self.infobox,
            redirect: redirect ?? self.redirect,
            relatedTopics: relatedTopics ?? self.relatedTopics,
            results: results ?? self.results,
            type: type ?? self.type,
            meta: meta ?? self.meta
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
	            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            print("Unknown Answer JSON")
            print(data.prettyPrintedJSONString ?? "")
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func unknownAnswerTask(with url: URL, completionHandler: @escaping (UnknownAnswer?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
