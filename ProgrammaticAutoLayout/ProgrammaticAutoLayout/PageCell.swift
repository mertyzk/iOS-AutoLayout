//
//  PageCell.swift
//  ProgrammaticAutoLayout
//
//  Created by Macbook Air on 31.05.2022.
//

import UIKit

class PageCell : UICollectionViewCell {
    
    
    var page : Pages?{
        didSet{
            guard let page = page else {
                return
            }
            
            googleImage.image = UIImage(named: page.imageName)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSMutableAttributedString(string: "\n\n\(page.description)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14) , NSAttributedString.Key.foregroundColor : UIColor.darkGray]))
            
            textFieldOfCompany.attributedText = attributedText
            textFieldOfCompany.textAlignment = .center

        }
    }
    
    
    private let googleImage : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "go3"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let textFieldOfCompany : UITextView = {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutEdit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func layoutEdit(){
        
        let topView = UIView()
        addSubview(topView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        topView.addSubview(googleImage)
        
        googleImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        googleImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        googleImage.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.6).isActive = true
        
        
        addSubview(textFieldOfCompany)
        textFieldOfCompany.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        textFieldOfCompany.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        textFieldOfCompany.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        textFieldOfCompany.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
}
