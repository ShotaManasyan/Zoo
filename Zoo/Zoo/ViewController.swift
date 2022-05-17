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
                
        initWelcomeLabel()
        initLanguagePickerView()
        initStartButton()
        activateConstraint()
        preSelectLanguage()
    }
    
    @objc func startButtonTapped() {
        let viewController = SecondViewController()
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func changeLanguage() {
        if let key = UserDefaults.standard.string(forKey: "preferedLanguage") {
            welcomeLabel.text = "welcomeTitle".addLocalizableString(str: key)
            startButton.setTitle("startButtonTitle".addLocalizableString(str: key), for: .normal)
        }
    }
    
    func preSelectLanguage() {
        guard let key = UserDefaults.standard.string(forKey: "preferedLanguage") else {
            languagePickerView.selectRow(0, inComponent: 0, animated: false)
            return
        }
        
        if key == "en" {
            languagePickerView.selectRow(0, inComponent: 0, animated: false)
        } else if key == "hy" {
            languagePickerView.selectRow(1, inComponent: 0, animated: false)
        } else if key == "ru" {
            languagePickerView.selectRow(2, inComponent: 0, animated: false)
        }
        
        changeLanguage()
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
        case 0:
            UserDefaults.standard.set("en", forKey: "preferedLanguage")
        case 1:
            UserDefaults.standard.set("hy", forKey: "preferedLanguage")
        case 2:
            UserDefaults.standard.set("ru", forKey: "preferedLanguage")
        default:
            break
        }
        changeLanguage()
    }
}
extension ViewController {
    
    func initWelcomeLabel() {
        welcomeLabel = UILabel()
        welcomeLabel.text = "welcomeTitle".localized
        welcomeLabel.font = .systemFont(ofSize: 25)
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
    }
    
    func initLanguagePickerView() {
        languagePickerView = UIPickerView()
        languagePickerView.translatesAutoresizingMaskIntoConstraints = false
        languagePickerView.dataSource = self
        languagePickerView.delegate = self
        
        view.addSubview(languagePickerView)
    }
    
    func initStartButton() {
        startButton = UIButton()
        buttonTitle = "startButtonTitle".localized
        startButton.setTitle(buttonTitle, for: .normal)
        startButton.layer.cornerRadius = 8
        startButton.backgroundColor = .systemBlue
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        view.addSubview(startButton)
    }
    
    func activateConstraint() {
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            languagePickerView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -80)
        ])
    }
}
