//
//  MainTableViewCellViewModel.swift
//  ReminderiOS
//
//  Created by Shinji Muto on 2019/02/06.
//  Copyright © 2019 subta90. All rights reserved.
//

import Foundation
import RxCocoa

final class MainTableViewCellViewModel {
    
    let inputText: ControlProperty<String?>
    
    init(inputText: ControlProperty<String?>) {
        self.inputText = inputText
    }
    
}
