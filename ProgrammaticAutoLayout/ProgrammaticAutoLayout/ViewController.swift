//
//  ViewController.swift
//  ProgrammaticAutoLayout
//
//  Created by Macbook Air on 30.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let googleImage : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "icons8-google-240"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let textFieldOfCompany : UITextView = {
        let textField = UITextView()
        /*textField.text = "Google is the largest search engine"
        textField.font = UIFont.boldSystemFont(ofSize: 18)*/
        
        let attributedText = NSMutableAttributedString(string: "Google is the largest search engine", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSMutableAttributedString(string: "\n\nGoogle LLC is an American multinational technology company focused on artificial intelligence, search engine, online advertising, cloud computing, computer software, quantum computing, e-commerce and consumer electronics.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14) , NSAttributedString.Key.foregroundColor : UIColor.darkGray]))
        textField.attributedText = attributedText
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isEditable = false
        textField.isScrollEnabled = false
        return textField
    }()
    
    private let buttonBack : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(textFieldOfCompany)
        buttonControl()
        layoutEdit()

        

        
        
    }
    
    private func layoutEdit(){
        
        let topView = UIView()
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        topView.addSubview(googleImage)
        
        googleImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        googleImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        googleImage.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.6).isActive = true
        
        
        
        textFieldOfCompany.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        textFieldOfCompany.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textFieldOfCompany.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textFieldOfCompany.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    fileprivate func buttonControl(){
        
        view.addSubview(buttonBack)
        buttonBack.backgroundColor = .blue
        NSLayoutConstraint.activate([
            buttonBack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonBack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonBack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonBack.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }


}

