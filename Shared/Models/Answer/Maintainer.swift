// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let maintainer = try Maintainer(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.maintainerTask(with: url) { maintainer, response, error in
//     if let maintainer = maintainer {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Maintainer
struct Maintainer: Codable {
    var github: String?
}

// MARK: Maintainer convenience initializers and mutators

extension Maintainer {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Maintainer.self, from: data)
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
        github: String?? = nil
    ) -> Maintainer {
        return Maintainer(
            github: github ?? self.github
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
