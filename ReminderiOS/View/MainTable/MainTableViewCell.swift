//
//  MainTableViewCell.swift
//  ReminderiOS
//
//  Created by subta on 2019/01/12.
//  Copyright © 2019 subta90. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainTableViewCell: UITableViewCell {
    
    // MARK: Property
    
    @IBOutlet weak var remindInputField: UITextField!
    
    @IBOutlet private weak var remindInfoButton: UIButton!
    
    private let infoButtonTappedRelay = PublishRelay<MainTableCellModelProtocol>()
    private let outOfFocusRelay = PublishRelay<MainTableCellModelProtocol>()
    
    private let model: MainTableCellModelProtocol = MainTableCellModel()
    
    private lazy var viewModel = MainTableCellViewModel(inputText: remindInputField.rx.text.orEmpty.asObservable(), model: model)
    
    private let disposeBag = DisposeBag()
    
    var infoButtonTappedObservable: Observable<MainTableCellModelProtocol> {
        return infoButtonTappedRelay.asObservable()
    }
    
    var outOfFocusObservable: Observable<MainTableCellModelProtocol> {
        return outOfFocusRelay.asObservable()
    }
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        
        viewModel.isInfoButtonHidden.asDriver(onErrorJustReturn: false)
            .drive(onNext: { [ unowned self ] hidden in
                self.remindInfoButton.isHidden = hidden
            })
        .disposed(by: disposeBag)
        
        remindInputField.rx.controlEvent(.editingDidEnd).asDriver()
            .drive(onNext: { [ unowned self ] text in
                let model = MainTableCellModel(message: self.remindInputField.text)
                self.outOfFocusRelay.accept(model)
            })
            .disposed(by: disposeBag)
        
        remindInfoButton.rx.tap.asDriver()
            .drive(onNext: { [ unowned self ] _ in
                let model = MainTableCellModel(message: self.remindInputField.text)
                self.infoButtonTappedRelay.accept(model)
            })
            .disposed(by: disposeBag)
    }
    
}
