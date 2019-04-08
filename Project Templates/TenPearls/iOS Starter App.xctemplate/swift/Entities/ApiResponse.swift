// ___FILEHEADER___

struct ApiResponse <T: Codable>: Codable {
    
    var data: T?
    var meta: Meta?
    
}
