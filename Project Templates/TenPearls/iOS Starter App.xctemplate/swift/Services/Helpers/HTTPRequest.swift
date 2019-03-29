//  Created on 06/09/2018.

import Alamofire
import Foundation

struct HTTPRequest: ServiceRequestAdaptor {

    static func request<T: Decodable>(_ urlRequest: URLRequestConvertible, model: T.Type, onCompletion: @escaping ServiceResponse) {
        let manager: SessionManager = Alamofire.SessionManager.default
        let operation: DataRequest = manager.request(urlRequest)
        
        debugPrint(operation)

        operation.validate().responseJSON { response -> Void in
            parseRequestResponse(response: response, statusCode: operation.response?.statusCode, model: model, onCompletion: onCompletion)
        }
    }
    
    static func multipartRequest<T: Decodable>(_ urlRequest: URLRequestConvertible, formData: [(key: String, data: Data)], model: T.Type, onCompletion: @escaping ServiceResponse) {
        let manager: SessionManager = Alamofire.SessionManager.default
        manager.upload(
            multipartFormData: { multipartFormData in
                for data in formData {
                    multipartFormData.append(data.data, withName: data.key)
                }
            },
            with: urlRequest,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.validate().responseJSON { response in
                        parseRequestResponse(response: response, statusCode: upload.response?.statusCode, model: model, onCompletion: onCompletion)
                    }
                case .failure(let encodingError):
                    debugPrint("ERROR: ", encodingError)
                    onError(error: encodingError as ErrorConvertible, serviceData: nil, statusCode: nil, onCompletion: onCompletion)
                    
                }
            }
        )
    }
    
    private static func parseRequestResponse<T: Decodable>(response: DataResponse<Any>, statusCode: Int?, model: T.Type, onCompletion: ServiceResponse) {
        switch response.result {
        case .success(let data):
            debugPrint("SERVICE RESPONSE: ", data)
            onSuccess(response: response.data, model: model, onCompletion: onCompletion)

        case .failure(let error):
            if let data = response.data, let errorResponse = String(data: data, encoding: String.Encoding.utf8) {
                debugPrint("SERVICE ERROR: ", errorResponse)
            }
            
            debugPrint("ERROR: ", error)
            onError(error: error as ErrorConvertible, serviceData: response.data, statusCode: statusCode, onCompletion: onCompletion)
        }
    }
    
    private static func shouldTryParseIfError(error: ErrorConvertible?, with statusCode: Int?) -> Bool {
        if let statusCode = statusCode, 500...599 ~= statusCode {
            return false
        }
        if let code = error?.errorCode() {
            return code != NSURLErrorTimedOut && code != NSURLErrorNetworkConnectionLost
        }
        return true
    }

    private static func onError(error: ErrorConvertible?, serviceData: Data?, statusCode: Int?, onCompletion: ServiceResponse) {
        var decodedErrorObject: ErrorConvertible? = error
        if let errorData = serviceData, !errorData.isEmpty, shouldTryParseIfError(error: error, with: statusCode) {
            do {
                decodedErrorObject = try JSONDecoder().decode( ServiceError.self, from: errorData)
                if let err = decodedErrorObject as? ServiceError {
                    err.statusCode = statusCode
                }
            } catch let exception {
                debugPrint("PARSING ERROR: ", (exception as NSError).debugDescription)
                
                let reason = AFError.ResponseSerializationFailureReason.jsonSerializationFailed(error: exception)
                decodedErrorObject = AFError.responseSerializationFailed(reason: reason)
            }
        }
        onCompletion(.failure(decodedErrorObject))
    }
    
    private static func onSuccess<T: Decodable>(response: Data?, model: T.Type, onCompletion: ServiceResponse) {
        guard let data = response, !data.isEmpty else {
            onCompletion(.success(nil))
            return
        }
        var decodedObject: Decodable?
        do {
            let decoder = JSONDecoder()
            //decoder.dateDecodingStrategy = .formatted(Formatter.iso8601)
            decodedObject = try decoder.decode( model, from: data)
            onCompletion(.success(decodedObject))
            
        } catch let exception {
            debugPrint("PARSING ERROR: ", (exception as NSError).debugDescription)

            let reason = AFError.ResponseSerializationFailureReason.jsonSerializationFailed(error: exception)
            let error = AFError.responseSerializationFailed(reason: reason)
            onCompletion(.failure(error))
        }

    }
}
