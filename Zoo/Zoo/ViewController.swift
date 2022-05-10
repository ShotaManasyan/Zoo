//
//  ViewController.swift
//  Zoo
//
//  Created by Basic 55 on 10.05.22.
//

import UIKit

class ViewController: UIViewController {
    
    var welcomeLabel: UILabel!
    var languagePickerView: UIPickerView!
    var startButton: UIButton!
    var stackView: UIStackView!
    var languagesArray = ["Armenian","English","Russan"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initStackView()
        initWelcomeLabel()
        initLanguagePickerView()
        initStartButton()
        activateConstraint()
        
    }

    

}

extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        1
    }
    
    
    
}

extension ViewController {
    
    func initStackView() {
        stackView = UIStackView()
        stackView.spacing = 40
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
    }
    
    func initWelcomeLabel() {
        welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome Zoo"
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(welcomeLabel)
    }
    
    func initLanguagePickerView() {
        languagePickerView = UIPickerView()
        languagePickerView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(languagePickerView)
    }
    
    func initStartButton() {
        startButton = UIButton()
        startButton.setTitle("Get Start", for: .normal)
        startButton.layer.cornerRadius = 8
        startButton.backgroundColor = .systemBlue
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(startButton)
    }
    
    func activateConstraint() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            
            startButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
