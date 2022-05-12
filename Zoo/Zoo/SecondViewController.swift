//
//  SecondViewController.swift
//  Zoo
//
//  Created by Shota Manasyan on 11.05.22.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var stackView: UIStackView!
    var animalType: ReusableButton!
    var animalTypesData: [String] = ["Birds","Fish","Mammals","Reptiles","Amphibians","Minibeasts"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        initStackView()
        activateConstraints()
        initanimalTypesButton()
    }
    
    func initanimalTypesButton() {
        for type in animalTypesData {
            animalType = ReusableButton()
            animalType.translatesAutoresizingMaskIntoConstraints = false
            animalType.text = type
            animalType.setImage = UIImage(named: type)
            stackView.addArrangedSubview(animalType)
        }
    }
}

extension SecondViewController {
    
    func initStackView() {
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func activateConstraints() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
        ])
    }
}