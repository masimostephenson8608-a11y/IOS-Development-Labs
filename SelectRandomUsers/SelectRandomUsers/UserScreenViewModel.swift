//
//  UserScreenViewModel.swift
//  SelectRandomUsers
//
//  Created by Masimo Stephenson on 2/23/26.
//

import Foundation
import Observation

@Observable
class UserScreenViewModel {
    var names: [User]
    var selectAmount: Int = 0
    
    init(names: [User]) {
        self.names = names
    }
    
    func addUser(user: User) {
        names.append(user)
    }
    
    func randomSelect() {
        var selectableUsers = names
        var selected: [User] = []

        for name in names {
            name.selected = false
        }
        
        for count in 0..<selectAmount {
            let num = Int.random(in: 0..<selectableUsers.count)
            selected.append(selectableUsers[num])
            selectableUsers.remove(at: num)
        }
        
        for count in 0..<selected.count {
            for secondCount in 0..<names.count {
                if selected[count].id == names[secondCount].id {
                    names[secondCount].selected = true
                }
            }
        }
    }
}
