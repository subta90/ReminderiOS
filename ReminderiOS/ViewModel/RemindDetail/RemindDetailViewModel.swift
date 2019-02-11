//
//  RemindDetailViewControllerViewModel.swift
//  ReminderiOS
//
//  Created by subta on 2019/02/09.
//  Copyright © 2019 subta90. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol RemindDetailViewModelProtocol {
    
    var model: Driver<RemindDetailModelProtocol> { get }
    
}

final class RemindDetailViewModel: RemindDetailViewModelProtocol {
 
    var model: Driver<RemindDetailModelProtocol>
    
    init(model: Driver<RemindDetailModelProtocol>) {
        self.model = model
    }
}
