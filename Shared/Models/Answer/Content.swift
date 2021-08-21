// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let content = try Content(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.contentTask(with: url) { content, response, error in
//     if let content = content {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Content
struct Content: Codable {
    var dataType, label: String?
    var value: ValueUnion?
    var wikiOrder: WikiOrder?

    enum CodingKeys: String, CodingKey {
        case dataType = "data_type"
        case label, value
        case wikiOrder = "wiki_order"
    }
}

// MARK: Content convenience initializers and mutators

extension Content {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Content.self, from: data)
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
        dataType: String?? = nil,
        label: String?? = nil,
        value: ValueUnion?? = nil,
        wikiOrder: WikiOrder?? = nil
    ) -> Content {
        return Content(
            dataType: dataType ?? self.dataType,
            label: label ?? self.label,
            value: value ?? self.value,
            wikiOrder: wikiOrder ?? self.wikiOrder
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
