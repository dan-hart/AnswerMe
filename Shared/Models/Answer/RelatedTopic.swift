// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let relatedTopic = try RelatedTopic(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.relatedTopicTask(with: url) { relatedTopic, response, error in
//     if let relatedTopic = relatedTopic {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - RelatedTopic
struct RelatedTopic: Codable {
    var firstURL: String?
    var icon: RelatedTopicIcon?
    var result, text: String?

    enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case icon = "Icon"
        case result = "Result"
        case text = "Text"
    }
}

// MARK: RelatedTopic convenience initializers and mutators

extension RelatedTopic {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RelatedTopic.self, from: data)
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
        firstURL: String?? = nil,
        icon: RelatedTopicIcon?? = nil,
        result: String?? = nil,
        text: String?? = nil
    ) -> RelatedTopic {
        return RelatedTopic(
            firstURL: firstURL ?? self.firstURL,
            icon: icon ?? self.icon,
            result: result ?? self.result,
            text: text ?? self.text
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
