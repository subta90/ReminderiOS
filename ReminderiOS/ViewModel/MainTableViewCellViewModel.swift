//
//  MainTableViewCellViewModel.swift
//  ReminderiOS
//
//  Created by Shinji Muto on 2019/02/06.
//  Copyright © 2019 subta90. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class MainTableViewCellViewModel {
    
    let inputText: ControlProperty<String>
    
    let isInfoButtonHidden: Observable<Bool>
    
    init(inputText: ControlProperty<String>, model: MainTableViewCellModel) {
        
        self.inputText = inputText
        
        self.isInfoButtonHidden = inputText.map { text in
            return model.isInfoButtonHidden(text: text)
        }
    }
}
