//
//  CompanyDM.swift
//  Avito
//
//  Created by Islomjon on 19/08/22.
//

import SwiftyJSON

struct CompanyDM {
    
    var companyName: String
    var employes: EmployesDM
    
    init(jsonData: JSON) {
        self.companyName = jsonData["name"].stringValue
        self.employes = EmployesDM(employes: jsonData["employees"])
    }
}


struct EmployesDM {
    
    var name: String
    var phoneNumber: Int
    var skills: [String]
    
    func skillsString() -> String {
        var str: String = ""
        for skill in skills {
            str += skill + ", "
        }
        return str
    }
    
    init(employes: JSON) {
        self.name = employes["name"].stringValue
        self.phoneNumber = employes["phone_number"].intValue
        self.skills = employes["skills"].arrayValue.compactMap{ $0.stringValue }
    }
    
}
