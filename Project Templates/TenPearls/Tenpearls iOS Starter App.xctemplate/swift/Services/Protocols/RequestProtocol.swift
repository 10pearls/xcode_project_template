//  Created on ___DATE___.

import UIKit

protocol RequestProtocol {
    
    func paramDictionary() -> [String: AnyObject]?
    func makeRequest<T: Decodable>(_ model: T.Type, block: @escaping ServiceResponse )
}
