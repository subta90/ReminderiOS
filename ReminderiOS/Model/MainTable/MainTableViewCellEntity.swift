//
//  MainTableViewCellEntity.swift
//  ReminderiOS
//
//  Created by Shinji Muto on 2019/01/13.
//  Copyright © 2019 subta90. All rights reserved.
//

import Foundation

struct MainTableViewCellEntity {
    var message: String?
    
    init() {
        message = ""
    }
    
    init(message: String?) {
        self.message = message
    }
}
