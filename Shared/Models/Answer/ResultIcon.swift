// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let resultIcon = try ResultIcon(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.resultIconTask(with: url) { resultIcon, response, error in
//     if let resultIcon = resultIcon {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - ResultIcon
struct ResultIcon: Codable {
    var height: Int?
    var url: String?
    var width: Int?

    enum CodingKeys: String, CodingKey {
        case height = "Height"
        case url = "URL"
        case width = "Width"
    }
}

// MARK: ResultIcon convenience initializers and mutators

extension ResultIcon {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ResultIcon.self, from: data)
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
        height: Int?? = nil,
        url: String?? = nil,
        width: Int?? = nil
    ) -> ResultIcon {
        return ResultIcon(
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
