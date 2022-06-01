//
//  ViewController.swift
//  ExamplesOfProgrammaticAutoLayout
//
//  Created by Macbook Air on 1.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let view1 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 150, y: 100, width: 20, height: 20)
        view.backgroundColor = .red
        return view
    }()
    
    let view2 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 150, y: 100, width: 20, height: 20)
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(view1)
        view.addSubview(view2)
        
        constraintView1()
        constraintView2()
        
        
    }
    
    func constraintView1(){
     
        // view1'in merkezde konumlandırılmasını istiyoruz. yatayda ve dikeyde ortalanmasını istiyoruz ve genişlik / yükseklik değerleri vereceğiz.
        
        // ----------------------------------------
        
        // burada constant'ı 100 yaparsak, merkezden sağa 100 kaydırır. (x eksenine göre)
        NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true

        // burada constant'ı 100 yaparsak, merkezden aşağı 100 kaydırır. (y eksenine göre)
        NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
        
        
        NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 210).isActive = true // 210 width
        
        NSLayoutConstraint(item: view1, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 210).isActive = true

    }
    
    
    
    func constraintView2(){
        
        NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: view1, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: view1, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: -10).isActive = true
        
        NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 110).isActive = true
        
        NSLayoutConstraint(item: view2, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 110).isActive = true

        
    }


}

