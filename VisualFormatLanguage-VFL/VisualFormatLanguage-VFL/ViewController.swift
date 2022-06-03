//
//  ViewController.swift
//  VisualFormatLanguage-VFL
//
//  Created by Macbook Air on 1.06.2022.
//

/*

[view1] -> bir view'i belirtmek için kullanılır
[view1]-[view2] -> iki view arasında standart boşluk miktarını bırakır. genelde 8 point
| | -> superview'i temsil eder
H: ile yatay kastedilir
V: ile dikey kastedilir
 
-miktar- ile constraint atanır. bu ifade view'den önce ya da sonra gelebilir. -10-[view] ya da [view]-20-
 solunda ya da sağında olması önem arz eder.
 eğer başta H: varsa kısıt yatayda uygulanır. Soldaysa soldan boşluk, sağdaysa sağdan boşluk bırakır.
 eğer başta V: varsa kısıt dikeyde uygulanır. soldaysan yukardan boşluk, sağdaysan aşağıdan boşluk bırakır.
 
 [view(miktar)]
 Eğer başta H varsa atanan değer genişlik olarak, eğer başta V: varsa yükseklik olarak atanır.
 Eğer herhangi bir miktar değeri girilmezse başta verilen H-V ifadesine göre tüm yeri kapsar.
 
 @değer ifadesi ile priorty değeri atanır. Örneğin -15@750-[view1] veya [view1(50@250)]
 
 [view(>=60<=100)] ile aralık verebiliriz. Örneğin başta H varsa bu view'in genişliği duruma göre 60-100 arasında olacaktır.

*/


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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        view.addSubview(redView)
        view.addSubview(blueView)
        
        
        let viewAll = ["redView" : redView, "blueView" : blueView]
        /*view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[redView(100)]|", options: [], metrics: nil, views: viewAll))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[redView(150)]|", options: [], metrics: nil, views: viewAll))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[blueView(150@250)]|", options: [], metrics: nil, views: viewAll))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[blueView(==redView@750)]|", options: [], metrics: nil, views: viewAll))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[redView]-30-[blueView]|", options: [], metrics: nil, views: viewAll))*/
        
        let olculer = ["yukseklik" : view.frame.size.height / 4 , "genislik" : view.frame.size.width / 3, "ust" : view.frame.size.height / 3]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-ust-[redView(yukseklik)]|", options: [], metrics: olculer, views: viewAll))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-ust-[blueView(yukseklik)]|", options: [], metrics: olculer, views: viewAll))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[redView(genislik)]-[blueView(genislik)]-10-|", options: [], metrics: olculer, views: viewAll))
        
    }


}

