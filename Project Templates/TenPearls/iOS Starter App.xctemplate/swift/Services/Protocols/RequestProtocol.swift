// ___FILEHEADER___.

protocol RequestProtocol {
    
    func requestTimeout() -> Double
    func queryParameters() -> [(key: String, value: String)]?
    func requestBody() -> [String: Any]?
    func makeRequest<T: Decodable>(_ model: T.Type)
    
}
