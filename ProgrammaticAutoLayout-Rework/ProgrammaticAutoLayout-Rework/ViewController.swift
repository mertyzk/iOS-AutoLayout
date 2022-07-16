//
//  ViewController.swift
//  ProgrammaticAutoLayout-Rework
//
//  Created by Macbook Air on 16.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        
        let grayView = UIView()
        grayView.backgroundColor = .gray
        
        let brownView = UIView()
        brownView.backgroundColor = .brown
        
        [blueView, yellowView, grayView].forEach {
            view.addSubview($0)
        }
        
        view.addSubview(brownView)
        brownView.fillSuperview()
        
        blueView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                        bottom: nil,
                        leading: view.safeAreaLayoutGuide.leadingAnchor,
                        trailing: nil,
                        padding: .init(top: 0, left: 10, bottom: 0, right: 10),
                        size: .init(width: 111, height: 0))
        
        blueView.heightAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true
        
        yellowView.anchor(top: blueView.bottomAnchor,
                          bottom: nil,
                          leading: blueView.leadingAnchor,
                          trailing: nil,
                          padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        /*yellowView.widthAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalTo: blueView.heightAnchor).isActive = true*/ // func anchorSize writed
        yellowView.anchorSize(view: blueView)
        
        grayView.anchor(top: blueView.topAnchor,
                        bottom: yellowView.bottomAnchor,
                        leading: blueView.trailingAnchor,
                        trailing: view.safeAreaLayoutGuide.trailingAnchor,
                        padding: .init(top: 0, left: 10, bottom: 0, right: 10)
                        )
        
 
        

        
        
    }


}

extension UIView {
    
    func anchor(top : NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading : NSLayoutXAxisAnchor?, trailing : NSLayoutXAxisAnchor?, padding : UIEdgeInsets = .zero, size : CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }

    }
    
    func anchorSize(view : UIView){
        
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }
    
    func fillSuperview() {
        anchor(top: superview?.topAnchor, bottom: superview?.bottomAnchor, leading: superview?.leadingAnchor, trailing: superview?.trailingAnchor)
    }
    
}
