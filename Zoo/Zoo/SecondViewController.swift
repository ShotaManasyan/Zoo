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
    
    lazy var animalTypesData: [String] = ["Birds", "Fishs", "Mammals", "Reptiles", "Amphibians", "Arthropod"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        initStackView()
        activateConstraints()
        initanimalTypesButton()
    }
    
    func initanimalTypesButton() {
        for (index, type) in animalTypesData.enumerated() {
            let animalType = ReusableButton()
            animalType.id = index
            animalType.translatesAutoresizingMaskIntoConstraints = false
            animalType.text = type.localized
            animalType.image = UIImage(named: type)
            stackView.addArrangedSubview(animalType)
            animalType.delegate = self
        }
    }
}

extension SecondViewController: ReusableButtonDelegate {
    func didTappedButton(with id: Int, buttonModel: ReusableButtonModel) {
        print("button with \(id) tapped")
    }
    
    func didTouchDown(sender: ReusableButton) {
        sender.heightConstraint.constant = 200
    }
    
    func didTouchCancel(sender: ReusableButton) {
        sender.heightConstraint.constant = 50
        let viewController = AnimalListTableViewController()
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
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
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25)
        ])
    }
}
