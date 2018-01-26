//  Created on 12/01/2018.

import Foundation

class User: BaseEntity {
    
    // MARK: - Members
    var username: String
    var agentName: String
    var email: String
    var contact: String
    var company: String?
    var password: String
    
    // MARK: - Constructors
    init(username: String, agentName: String, email: String, contact: String, company: String?, password: String) {
        
        self.username = username
        self.agentName = agentName
        self.email = email
        self.contact = contact
        if let companyValue = company {
            self.company = companyValue
        }
        self.password = password
        
        super.init()
    }
    
    convenience init(username: String, password: String) {
        self.init(username: username, agentName: "", email: "", contact: "", company: "", password: password)
    }
}
