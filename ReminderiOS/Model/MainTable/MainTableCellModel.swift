//
//  MainTableCellModel.swift
//  ReminderiOS
//
//  Created by subta on 2019/02/11.
//  Copyright © 2019 subta90. All rights reserved.
//

import Foundation
import RxSwift

protocol MainTableCellModelProtocol {
    var message: String? { get }
}

final class MainTableCellModel: MainTableCellModelProtocol {
    
    var message: String?
    
    init() {
        message = ""
    }
    
    init(message: String?) {
        self.message = message
    }
    
}
