//  Created on 06/09/2018.

protocol RequestProtocol {
    
    func requestTimeout() -> Double
    func queryParameters() -> [(key: String, value: String)]?
    func requestBody() -> [String: Any]?
    func makeRequest<T: Decodable>(_ model: T.Type)
    
}
