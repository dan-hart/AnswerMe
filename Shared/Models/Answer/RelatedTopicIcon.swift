// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let relatedTopicIcon = try RelatedTopicIcon(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.relatedTopicIconTask(with: url) { relatedTopicIcon, response, error in
//     if let relatedTopicIcon = relatedTopicIcon {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - RelatedTopicIcon
struct RelatedTopicIcon: Codable {
    var height, url, width: String?

    enum CodingKeys: String, CodingKey {
        case height = "Height"
        case url = "URL"
        case width = "Width"
    }
}

// MARK: RelatedTopicIcon convenience initializers and mutators

extension RelatedTopicIcon {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RelatedTopicIcon.self, from: data)
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
        height: String?? = nil,
        url: String?? = nil,
        width: String?? = nil
    ) -> RelatedTopicIcon {
        return RelatedTopicIcon(
            height: height ?? self.height,
            url: url ?? self.url,
            width: width ?? self.width
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
