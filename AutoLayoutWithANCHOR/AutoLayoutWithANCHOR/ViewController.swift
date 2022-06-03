//
//  ViewController.swift
//  AutoLayoutWithANCHOR
//
//  Created by Macbook Air on 3.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let redView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let blueView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    let orangeView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(redView)
        view.addSubview(blueView)
        view.addSubview(orangeView)
        
        redViewConstraint()
        blueViewConstraint()
        orangeViewConstraint()
        
        
    }
    
    func redViewConstraint(){
        redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func blueViewConstraint(){
        blueView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        blueView.widthAnchor.constraint(equalTo: redView.widthAnchor).isActive = true // (equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        blueView.heightAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
        blueView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func orangeViewConstraint(){
        orangeView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor).isActive = true
        orangeView.leadingAnchor.constraint(equalTo: redView.leadingAnchor).isActive = true
        orangeView.bottomAnchor.constraint(equalTo: redView.topAnchor, constant: -20).isActive = true
        orangeView.heightAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1.3).isActive = true
        orangeView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 40).isActive = true
        
        
    }
    
    
    


}

