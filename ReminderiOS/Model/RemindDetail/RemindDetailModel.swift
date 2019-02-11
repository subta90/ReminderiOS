//
//  RemindDetailModel.swift
//  ReminderiOS
//
//  Created by subta on 2019/02/11.
//  Copyright © 2019 subta90. All rights reserved.
//

import Foundation
import RxSwift

protocol RemindDetailModelProtocol {
    var message: String? { get }
}

final class RemindDetailModel: RemindDetailModelProtocol {
    
    var message: String?
    
    init() {
        message = ""
    }
    
    init(message: String?) {
        self.message = message
    }
    
}
