//  Created on 04/12/2018.

struct ApiResponse <T: Codable>: Codable {
    
    var data: T?
    var meta: Meta?
    
}
