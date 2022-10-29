//
//  NewModel.swift
//  PointoApp
//
//  Created by Ekrem Özkaraca on 29.10.2022.
//

import Foundation

struct Welcome: Codable {
    let isMaintenance: Bool
    let statusCode: Int
    let errorMessage, errorCode, validationErrorMessages: JSONNull?
    let result: Resultseq
    let sid, requestID, logURL: String

    enum CodingKeys: String, CodingKey {
        case isMaintenance, statusCode, errorMessage, errorCode, validationErrorMessages, result, sid
        case requestID = "requestId"
        case logURL = "logUrl"
    }
}

// MARK: - Result
struct Resultseq: Codable {
    let isSuccess: Bool
    let message, explanation, errorCode: JSONNull?
    let resultObject: [ResultObject]
    let jobID: JSONNull?
    let params: Params
    let requestContextID: String
}

// MARK: - Params
struct Params: Codable {
}

// MARK: - ResultObject
struct ResultObject: Codable {
    let key: Int
    let value: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
