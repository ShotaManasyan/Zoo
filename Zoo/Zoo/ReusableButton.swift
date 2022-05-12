//
//  ReusableButton.swift
//  Zoo
//
//  Created by Shota Manasyan on 11.05.22.
//

import Foundation
import UIKit

class ReusableButton: UIStackView {
    
    var buttonNameLabel: UILabel!
    var button: UIButton!
    private var heightConstraint: NSLayoutConstraint!
    
    var text: String? {
        set {
            return buttonNameLabel.text = newValue
        }
        get {
            return self.text
        }
    }
    
    var setImage: UIImage? {
        set {
            return button.setImage(newValue, for: .normal)
        }
        get {
            return self.setImage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        heightConstraint.constant = 200
    }
    
    @objc func touchCancel() {
        heightConstraint.constant = 50
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

