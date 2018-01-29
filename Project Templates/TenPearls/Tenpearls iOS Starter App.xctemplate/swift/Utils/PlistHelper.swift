//___FILEHEADER___

import UIKit

class PlistHelper: NSObject {

    private var filePath: String = ""
    private var plistObject: Any?
    
    init(WithFileName fileName: String) {
        
        super.init()
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: "plist") else {
            fatalError("\(fileName).plist not found in the bundle")
        }
        
        filePath = path
        plistObject = NSDictionary(contentsOfFile: path)
    }

    func toObject<T: JSONEntity>(OfType type: T.Type, ForKey key: String) -> JSONEntity? {
        
        print(type)
        
        if plistObject == nil || plistObject is NSArray {
            return nil
        }
        
        if let object: [String: AnyObject] = plistObject as? [String: AnyObject], plistObject is NSDictionary {
            if let subObject: [String: AnyObject] = object[key] as? [String: AnyObject], object[key] is [String: AnyObject] {
                return type.init(WithDictionary: subObject)
            }
            return nil
        }
        
        return nil
    }
}
