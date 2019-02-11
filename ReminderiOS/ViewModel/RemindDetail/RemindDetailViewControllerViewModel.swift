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

final class RemindDetaialViewControllerViewModel {
 
//    var models: Observable<[MainTableViewCellEntity]>
    var model: Driver<MainTableCellModelProtocol>
    
//    init(models: Observable<[MainTableViewCellEntity]>) {
//        self.models = models
//    }
    
    init(model: Driver<MainTableCellModelProtocol>) {
        self.model = model
    }
}
