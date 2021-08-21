// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let topicIcon = try TopicIcon(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.topicIconTask(with: url) { topicIcon, response, error in
//     if let topicIcon = topicIcon {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - TopicIcon
struct TopicIcon: Codable {
    var height: Height?
    var url: String?
    var width: Height?

    enum CodingKeys: String, CodingKey {
        case height = "Height"
        case url = "URL"
        case width = "Width"
    }
}

// MARK: TopicIcon convenience initializers and mutators

extension TopicIcon {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TopicIcon.self, from: data)
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
        height: Height?? = nil,
        url: String?? = nil,
        width: Height?? = nil
    ) -> TopicIcon {
        return TopicIcon(
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
