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
}

final class MainTableCellViewModel: MainTableCellViewModelProtocol {
    
    let inputText: Observable<String>
    
    init(inputText: Observable<String>, model: MainTableCellModelProtocol) {
        
        self.inputText = inputText

    }
}
