// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let answer = try Answer(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.answerTask(with: url) { answer, response, error in
//     if let answer = answer {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Answer
struct Answer: Codable {
    var abstract, abstractSource, abstractText: String?
    var abstractURL: String?
    var answer, answerType, definition, definitionSource: String?
    var definitionURL, entity, heading, image: String?
    var imageHeight, imageIsLogo, imageWidth: Int?
    var infobox: Infobox?
    var redirect: String?
    var relatedTopics: [RelatedTopic]?
    var results: [Result]?
    var type: String?
    var meta: AnswerMeta?

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

// MARK: Answer convenience initializers and mutators

extension Answer {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Answer.self, from: data)
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
        infobox: Infobox?? = nil,
        redirect: String?? = nil,
        relatedTopics: [RelatedTopic]?? = nil,
        results: [Result]?? = nil,
        type: String?? = nil,
        meta: AnswerMeta?? = nil
    ) -> Answer {
        return Answer(
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
