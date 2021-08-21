// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let srcOptions = try SrcOptions(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.srcOptionsTask(with: url) { srcOptions, response, error in
//     if let srcOptions = srcOptions {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - SrcOptions
struct SrcOptions: Codable {
    var directory: String?
    var isFanon, isMediawiki, isWikipedia: Int?
    var language, minAbstractLength: String?
    var skipAbstract, skipAbstractParen: Int?
    var skipEnd: String?
    var skipIcon, skipImageName: Int?
    var skipQr, sourceSkip, srcInfo: String?

    enum CodingKeys: String, CodingKey {
        case directory
        case isFanon = "is_fanon"
        case isMediawiki = "is_mediawiki"
        case isWikipedia = "is_wikipedia"
        case language
        case minAbstractLength = "min_abstract_length"
        case skipAbstract = "skip_abstract"
        case skipAbstractParen = "skip_abstract_paren"
        case skipEnd = "skip_end"
        case skipIcon = "skip_icon"
        case skipImageName = "skip_image_name"
        case skipQr = "skip_qr"
        case sourceSkip = "source_skip"
        case srcInfo = "src_info"
    }
}

// MARK: SrcOptions convenience initializers and mutators

extension SrcOptions {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SrcOptions.self, from: data)
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
        directory: String?? = nil,
        isFanon: Int?? = nil,
        isMediawiki: Int?? = nil,
        isWikipedia: Int?? = nil,
        language: String?? = nil,
        minAbstractLength: String?? = nil,
        skipAbstract: Int?? = nil,
        skipAbstractParen: Int?? = nil,
        skipEnd: String?? = nil,
        skipIcon: Int?? = nil,
        skipImageName: Int?? = nil,
        skipQr: String?? = nil,
        sourceSkip: String?? = nil,
        srcInfo: String?? = nil
    ) -> SrcOptions {
        return SrcOptions(
            directory: directory ?? self.directory,
            isFanon: isFanon ?? self.isFanon,
            isMediawiki: isMediawiki ?? self.isMediawiki,
            isWikipedia: isWikipedia ?? self.isWikipedia,
            language: language ?? self.language,
            minAbstractLength: minAbstractLength ?? self.minAbstractLength,
            skipAbstract: skipAbstract ?? self.skipAbstract,
            skipAbstractParen: skipAbstractParen ?? self.skipAbstractParen,
            skipEnd: skipEnd ?? self.skipEnd,
            skipIcon: skipIcon ?? self.skipIcon,
            skipImageName: skipImageName ?? self.skipImageName,
            skipQr: skipQr ?? self.skipQr,
            sourceSkip: sourceSkip ?? self.sourceSkip,
            srcInfo: srcInfo ?? self.srcInfo
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
