//  Created on ___DATE___.

import UIKit

class JSONEntity: BaseEntity {
    
    required init(WithDictionary dictionary: [String: AnyObject]) {
        super.init()
        self.setValuesForKeys(dictionary)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        TryCatch.try({
            super.setValue(value, forKey: key)
        }, catch: {
            print("\(key) not found in \(String(describing: self))")
        }, finally: {
        })
    }
}
