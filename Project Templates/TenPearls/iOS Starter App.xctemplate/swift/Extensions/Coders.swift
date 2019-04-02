// ___FILEHEADER___.

import Foundation

extension Decodable {
    static func decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return try decoder.decode(Self.self, from: data)
    }
}

extension Encodable {
    func asDictionary() throws -> [String: Any]? {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .millisecondsSince1970
            
            let data = try encoder.encode(self)
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return jsonObject as? [String: Any]
            
        } catch let error {
            throw error
        }
    }
}
