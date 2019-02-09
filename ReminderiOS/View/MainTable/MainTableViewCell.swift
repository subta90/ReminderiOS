//
//  MainTableViewCell.swift
//  ReminderiOS
//
//  Created by Shinji Muto on 2019/01/12.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainTableViewCell: UITableViewCell {
    
    // MARK: Property
    
    @IBOutlet weak var remindInputField: UITextField!
    
    @IBOutlet private weak var remindInfoButton: UIButton!
    
    let infoButtonTappedRelay = PublishRelay<MainTableViewCellEntity>()
    let outOfFocusRelay = PublishRelay<MainTableViewCellEntity>()
    
    let model = MainTableViewCellModel()
    
    private lazy var viewModel = MainTableViewCellViewModel(inputText: remindInputField.rx.text.orEmpty.asObservable(), model: model)
    
    private let disposeBag = DisposeBag()
    
    // MARK: Life Cycle
    
    override func awakeFromNib() {
        
        viewModel.isInfoButtonHidden.asDriver(onErrorJustReturn: false)
            .drive(onNext: { [ unowned self ] hidden in
                self.remindInfoButton.isHidden = hidden
            })
        .disposed(by: disposeBag)
        
        remindInputField.rx.controlEvent(.editingDidEnd).asDriver()
            .drive(onNext: { [ unowned self ] text in
                let entity = MainTableViewCellEntity(message: self.remindInputField.text)
                self.outOfFocusRelay.accept(entity)
            })
            .disposed(by: disposeBag)
        
        remindInfoButton.rx.tap.asDriver()
            .drive(onNext: { [ unowned self ] _ in
                let entity = MainTableViewCellEntity(message: self.remindInputField.text)
                self.infoButtonTappedRelay.accept(entity)
            })
            .disposed(by: disposeBag)
    }
    
}
