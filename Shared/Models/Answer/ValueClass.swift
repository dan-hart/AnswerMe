// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let valueClass = try ValueClass(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.valueClassTask(with: url) { valueClass, response, error in
//     if let valueClass = valueClass {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - ValueClass
struct ValueClass: Codable {
    var entityType, id: String?
    var numericID: Int?

    enum CodingKeys: String, CodingKey {
        case entityType = "entity-type"
        case id
        case numericID = "numeric-id"
    }
}

// MARK: ValueClass convenience initializers and mutators

extension ValueClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ValueClass.self, from: data)
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
        entityType: String?? = nil,
        id: String?? = nil,
        numericID: Int?? = nil
    ) -> ValueClass {
        return ValueClass(
            entityType: entityType ?? self.entityType,
            id: id ?? self.id,
            numericID: numericID ?? self.numericID
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
