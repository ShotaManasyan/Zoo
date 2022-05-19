//
//  ReusableButton.swift
//  Zoo
//
//  Created by Shota Manasyan on 11.05.22.
//

import Foundation
import UIKit

protocol ReusableButtonDelegate: AnyObject {
    func didTouchDown(sender: ReusableButton)
    func didTouchCancel(sender: ReusableButton)
    func didTappedButton(with id: Int, buttonModel: ReusableButtonModel)
}

struct ReusableButtonModel {
    let name: String?
    let image: UIImage?
}

class ReusableButton: UIStackView {
    
    var buttonNameLabel: UILabel!
    var button: UIButton!
    var heightConstraint: NSLayoutConstraint! {
        didSet {
            layoutIfNeeded()
        }
    }
    weak var delegate: ReusableButtonDelegate?
    
    var text: String? {
        didSet {
            buttonNameLabel.text = text
        }
    }
    
    var image: UIImage? {
        didSet {
            button.setImage(image, for: .normal)
        }
    }
    
    var id: Int = 0 {
        didSet {
            button.tag = id
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        axis = .vertical
        spacing = 1
    
        initanimalTypesLabel()
        initanimalTypesButton()
        activate()
    }
    
    @objc func touchDown() {
        delegate?.didTouchDown(sender: self)
    }
    
    @objc func touchCancel() {
        delegate?.didTouchCancel(sender: self)
        
        let model = ReusableButtonModel(name: text, image: image)
        delegate?.didTappedButton(with: id, buttonModel: model)
    }
}

extension ReusableButton {
    
    func initanimalTypesLabel() {
        buttonNameLabel = UILabel()
        buttonNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(buttonNameLabel)
    }
    
    func initanimalTypesButton() {
        button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.addTarget(self, action: #selector(touchCancel), for: .touchUpInside)
        addArrangedSubview(button)
    }
    
    func activate() {
        heightConstraint = button.heightAnchor.constraint(equalToConstant: 50)
        heightConstraint.isActive = true
    }
}
