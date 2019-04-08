// ___FILEHEADER___

import Foundation

extension String {
    
    init(localizedKey: String) {
        self = Bundle.main.localizedString(forKey: localizedKey, value: nil, table: "English")
    }
    
}
