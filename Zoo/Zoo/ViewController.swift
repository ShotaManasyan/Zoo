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
    var buttonTitle: String!
    let languagesData = [ "English", "Հայերեն", "Русский"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
                
        initStackView()
        initWelcomeLabel()
        initLanguagePickerView()
        initStartButton()
        activateConstraint()
        
    }
    
    @objc func startButtonTapped() {
        let viewController = SecondViewController()
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func changeLanguage(str: String) {
        welcomeLabel.text = "welcomeTitle".addLocalizableString(str: str)
        startButton.setTitle("startButtonTitle".addLocalizableString(str: str), for: .normal)
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languagesData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languagesData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0: changeLanguage(str: "en")
        case 1: changeLanguage(str: "hy")
        case 2: changeLanguage(str: "ru")
        default:
            break
        }
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
        welcomeLabel.text = "welcomeTitle".localized
        welcomeLabel.font = .systemFont(ofSize: 25)
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(welcomeLabel)
    }
    
    func initLanguagePickerView() {
        languagePickerView = UIPickerView()
        languagePickerView.translatesAutoresizingMaskIntoConstraints = false
        languagePickerView.dataSource = self
        languagePickerView.delegate = self
        
        stackView.addArrangedSubview(languagePickerView)
    }
    
    func initStartButton() {
        startButton = UIButton()
        buttonTitle = "startButtonTitle".localized
        startButton.setTitle(buttonTitle, for: .normal)
        startButton.layer.cornerRadius = 8
        startButton.backgroundColor = .systemBlue
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        stackView.addArrangedSubview(startButton)
    }
    
    func activateConstraint() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
        ])
    }
}
