//
//  RemindDetailViewMessageCell.swift
//  ReminderiOS
//
//  Created by subta on 2019/02/09.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class RemindDetailViewMessageCell: UITableViewCell {
    
    // MARK: Property
    @IBOutlet weak var messageTextField: UITextField!
    
    private let messageRelay = PublishRelay<String?>()
    
    var messageObservable: Observable<String?> {
        return messageRelay.asObservable()
    }
    
    private lazy var viewModel = RemindDetailMessageCellViewModel(inputText: messageTextField.rx.text.orEmpty.asObservable())
    
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        
        viewModel.inputText.subscribe(onNext: { [ unowned self ] text in
            self.messageRelay.accept(text)
        })
        .disposed(by: disposeBag)
        
    }
}
