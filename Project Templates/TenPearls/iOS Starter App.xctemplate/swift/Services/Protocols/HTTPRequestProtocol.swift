// ___FILEHEADER___

import Alamofire

typealias HttpRequestMethod = HTTPMethod

protocol HTTPRequestProtocol: RequestProtocol, URLRequestConvertible {

    var serviceResponse: ServiceResponse { get set}
    
    // MARK: - Protocol Methods

    func urlAttributes() -> (method: HttpRequestMethod, endpoint: String)
    func serviceCallback() -> ServiceResponse
    func headers() -> [String: String]?
    func baseURL() -> String
    func requestEncoding() -> ParameterEncoding
    func multipartData() -> [(key: String, data: Data)]?
}

extension HTTPRequestProtocol {
    func makeRequest<T: Decodable>(_ model: T.Type) {
        if let formdata = multipartData() {
            HTTPRequest.multipartRequest(self, formData: formdata, model: model, onCompletion: serviceCallback())
        }
        HTTPRequest.request(self, model: model, onCompletion: serviceCallback())
    }

    func baseURL() -> String {
        return Constants.Domain.kApiBaseUrl
    }

    func headers() -> [String: String]? {
        var headers = [String: String]()
        let token: String = "" //Get Token from Defaults
        if !token.isEmpty {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        return !headers.isEmpty ? headers : nil
    }

    func queryParameters() -> [(key: String, value: String)]? {
        return nil
    }

    func requestBody() -> [String: Any]? {
        return nil
    }

    func serviceCallback() -> ServiceResponse {
        return serviceResponse
    }

    func requestEncoding() -> ParameterEncoding {
        return JSONEncoding.default
    }
    
    func requestTimeout() -> Double {
        return 300
    }
    
    func multipartData() -> [(key: String, data: Data)]? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlComponent: URLComponents? = URLComponents(string: baseURL() + urlAttributes().endpoint)
        let queryItems: [URLQueryItem]? = queryParameters()?.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponent?.queryItems = queryItems
        
        guard let url = try urlComponent?.asURL() else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorBadURL, userInfo: nil)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.timeoutInterval = requestTimeout()
        urlRequest.httpMethod = urlAttributes().method.rawValue
        
        if let headers = headers() {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        let encoding: ParameterEncoding = requestEncoding()
        urlRequest = try encoding.encode(urlRequest, with: requestBody())
        
        return urlRequest
    }
}
