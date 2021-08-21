// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let metaElement = try MetaElement(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.metaElementTask(with: url) { metaElement, response, error in
//     if let metaElement = metaElement {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - MetaElement
struct MetaElement: Codable {
    var dataType, label, value: String?

    enum CodingKeys: String, CodingKey {
        case dataType = "data_type"
        case label, value
    }
}

// MARK: MetaElement convenience initializers and mutators

extension MetaElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MetaElement.self, from: data)
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
        value: String?? = nil
    ) -> MetaElement {
        return MetaElement(
            dataType: dataType ?? self.dataType,
            label: label ?? self.label,
            value: value ?? self.value
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
