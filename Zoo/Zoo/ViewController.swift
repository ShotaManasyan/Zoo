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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
                
        initWelcomeLabel()
        initStartButton()
        activateConstraint()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(gearButtonPressed)
        )
    }
    
    @objc func gearButtonPressed() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    @objc func startButtonTapped() {
        let viewController = SecondViewController()
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ViewController {
    
    func initWelcomeLabel() {
        welcomeLabel = UILabel()
        welcomeLabel.text = NSLocalizedString("Welcome_title", comment: "")
        welcomeLabel.font = .systemFont(ofSize: 25)
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
    }
    
    func initStartButton() {
        startButton = UIButton()
        buttonTitle = NSLocalizedString("startButtonTitle", comment: "")
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
            
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
        ])
    }
}
