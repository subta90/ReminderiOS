//
//  RemindDetailViewMessageCellViewModel.swift
//  ReminderiOS
//
//  Created by Shinji Muto on 2019/02/09.
//  Copyright © 2019 subta90. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class RemindDetailViewMessageCellViewModel {
    
    let inputText: Observable<String>
    
    init(inputText: Observable<String>) {
        self.inputText = inputText
    }
}
