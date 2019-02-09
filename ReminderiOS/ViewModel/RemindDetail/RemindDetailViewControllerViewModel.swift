//
//  RemindDetailViewControllerViewModel.swift
//  ReminderiOS
//
//  Created by Shinji Muto on 2019/02/09.
//  Copyright © 2019 subta90. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class RemindDetaialViewControllerViewModel {
 
//    var models: Observable<[MainTableViewCellEntity]>
    var model: Driver<MainTableViewCellEntity>
    
//    init(models: Observable<[MainTableViewCellEntity]>) {
//        self.models = models
//    }
    
    init(model: Driver<MainTableViewCellEntity>) {
        self.model = model
    }
}
