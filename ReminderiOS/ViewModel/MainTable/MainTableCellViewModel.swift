//
//  MainTableCellViewModel.swift
//  ReminderiOS
//
//  Created by subta on 2019/02/11.
//  Copyright © 2019 subta90. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol MainTableCellViewModelProtocol {
    var inputText: Observable<String> { get }
    var isInfoButtonHidden: Observable<Bool> { get }
}

final class MainTableCellViewModel: MainTableCellViewModelProtocol {
    
    let inputText: Observable<String>
    
    let isInfoButtonHidden: Observable<Bool>
    
    init(inputText: Observable<String>, model: MainTableCellModelProtocol) {
        
        self.inputText = inputText
        
        self.isInfoButtonHidden = inputText.map { text in
            return model.isInfoButtonHidden(text: text)
        }
        
    }
}
