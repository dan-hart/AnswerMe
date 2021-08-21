// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let meta = try Meta(json)
//
// To read values from URLs:
//
//   let task = URLSession.shared.metaTask(with: url) { meta, response, error in
//     if let meta = meta {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Meta
struct Meta: Codable {
    var attribution, blockgroup, createdDate: JSONNull?
    var metaDescription: String?
    var designer, devDate: JSONNull?
    var devMilestone: String?
    var developer: [Developer]?
    var exampleQuery, id: String?
    var isStackexchange: JSONNull?
    var jsCallbackName: String?
    var liveDate: JSONNull?
    var maintainer: Maintainer?
    var name, perlModule: String?
    var producer: JSONNull?
    var productionState, repo, signalFrom, srcDomain: String?
    var srcID: Int?
    var srcName: String?
    var srcOptions: SrcOptions?
    var srcURL: JSONNull?
    var status, tab: String?
    var topic: [String]?
    var unsafe: Int?

    enum CodingKeys: String, CodingKey {
        case attribution, blockgroup
        case createdDate = "created_date"
        case metaDescription = "description"
        case designer
        case devDate = "dev_date"
        case devMilestone = "dev_milestone"
        case developer
        case exampleQuery = "example_query"
        case id
        case isStackexchange = "is_stackexchange"
        case jsCallbackName = "js_callback_name"
        case liveDate = "live_date"
        case maintainer, name
        case perlModule = "perl_module"
        case producer
        case productionState = "production_state"
        case repo
        case signalFrom = "signal_from"
        case srcDomain = "src_domain"
        case srcID = "src_id"
        case srcName = "src_name"
        case srcOptions = "src_options"
        case srcURL = "src_url"
        case status, tab, topic, unsafe
    }
}

// MARK: Meta convenience initializers and mutators

extension Meta {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Meta.self, from: data)
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
        attribution: JSONNull?? = nil,
        blockgroup: JSONNull?? = nil,
        createdDate: JSONNull?? = nil,
        metaDescription: String?? = nil,
        designer: JSONNull?? = nil,
        devDate: JSONNull?? = nil,
        devMilestone: String?? = nil,
        developer: [Developer]?? = nil,
        exampleQuery: String?? = nil,
        id: String?? = nil,
        isStackexchange: JSONNull?? = nil,
        jsCallbackName: String?? = nil,
        liveDate: JSONNull?? = nil,
        maintainer: Maintainer?? = nil,
        name: String?? = nil,
        perlModule: String?? = nil,
        producer: JSONNull?? = nil,
        productionState: String?? = nil,
        repo: String?? = nil,
        signalFrom: String?? = nil,
        srcDomain: String?? = nil,
        srcID: Int?? = nil,
        srcName: String?? = nil,
        srcOptions: SrcOptions?? = nil,
        srcURL: JSONNull?? = nil,
        status: String?? = nil,
        tab: String?? = nil,
        topic: [String]?? = nil,
        unsafe: Int?? = nil
    ) -> Meta {
        return Meta(
            attribution: attribution ?? self.attribution,
            blockgroup: blockgroup ?? self.blockgroup,
            createdDate: createdDate ?? self.createdDate,
            metaDescription: metaDescription ?? self.metaDescription,
            designer: designer ?? self.designer,
            devDate: devDate ?? self.devDate,
            devMilestone: devMilestone ?? self.devMilestone,
            developer: developer ?? self.developer,
            exampleQuery: exampleQuery ?? self.exampleQuery,
            id: id ?? self.id,
            isStackexchange: isStackexchange ?? self.isStackexchange,
            jsCallbackName: jsCallbackName ?? self.jsCallbackName,
            liveDate: liveDate ?? self.liveDate,
            maintainer: maintainer ?? self.maintainer,
            name: name ?? self.name,
            perlModule: perlModule ?? self.perlModule,
            producer: producer ?? self.producer,
            productionState: productionState ?? self.productionState,
            repo: repo ?? self.repo,
            signalFrom: signalFrom ?? self.signalFrom,
            srcDomain: srcDomain ?? self.srcDomain,
            srcID: srcID ?? self.srcID,
            srcName: srcName ?? self.srcName,
            srcOptions: srcOptions ?? self.srcOptions,
            srcURL: srcURL ?? self.srcURL,
            status: status ?? self.status,
            tab: tab ?? self.tab,
            topic: topic ?? self.topic,
            unsafe: unsafe ?? self.unsafe
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
