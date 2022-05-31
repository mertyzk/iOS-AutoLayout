//
//  TransitionControl.swift
//  ProgrammaticAutoLayout
//
//  Created by Macbook Air on 31.05.2022.
//

import Foundation
import UIKit

class TransitionControl : UICollectionViewController{
    
    
    let pagez = [
        Pages(imageName: "amzn", title: "Amazon is best e-commerce website",description: "Amazon.com, Inc. It is an American multinational technology company headquartered in Seattle, Washington, focusing on e-commerce, cloud computing, digital streaming, and artificial intelligence. Along with Google, Apple, Microsoft, and Facebook, the U.S. It is on the list of the Five Biggest Companies in the information technology industry."),
        Pages(imageName: "face", title: "Facebook Social Platform",description: "Meta Inc. or formerly Facebook Inc., is an American social media and media conglomerate headquartered in Menlo Park, California. It was founded with Mark Zuckerberg, his roommates, and Harvard College's Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, and Chris Hughes."),
        Pages(imageName: "insta", title: "Instagram Picture And Video Social",description: "Instagram is a free photo and video sharing app on social media. The app allows users to upload media. Media can be edited with filters, Hashtags and geotagging. Posts can be shared publicly or with pre-approved followers."),
        Pages(imageName: "go3", title: "Google Search Engine",description: "Google LLC is an American multinational technology company focused on artificial intelligence, search engine, online advertising, cloud computing, computer software, quantum computing, e-commerce and consumer electronics.")
    ]
    
    private let buttonBack : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(buttonBackClicked), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    @objc func buttonBackClicked(){
        pageControl.currentPage -= 1
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        print("Count of pages : \(pageControl.numberOfPages)")
    }
    
    private let buttonNext : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.addTarget(self, action: #selector(buttonNextClicked), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    @objc func buttonNextClicked(){
        
        pageControl.currentPage += 1
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
        print("Count of pages : \(pageControl.numberOfPages)")
        
    }
    
    private lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pagez.count
        pageControl.currentPageIndicatorTintColor = UIColor.newRed
        pageControl.pageIndicatorTintColor = UIColor.lowRed
        return pageControl
    }()
    
    fileprivate func buttonControl(){
        
        //view.addSubview(buttonBack)
        
        let buttonStackView = UIStackView(arrangedSubviews: [buttonBack, pageControl, buttonNext])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        //buttonStackView.axis = .vertical // butonları alt alta getirir.
        buttonStackView.distribution = .fillEqually
        
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    override func viewDidLoad() {
        buttonControl()
        super.viewDidLoad()
        collectionViewProperty()
    }
}

extension TransitionControl{
    
    func collectionViewProperty(){
        collectionView.delegate = self
        collectionView.backgroundColor = .gray
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isPagingEnabled = true // her bir eleman bir sayfa gibi
    }
}




extension TransitionControl : UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pagez.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCell
        
        //cell.googleImage.image = UIImage(named: pages[indexPath.row].imageName)
        //cell.textFieldOfCompany.text = pages[indexPath.row].title
        cell.page = pagez[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) { // bu fonksiyon ile dokunma işlemlerini kontrol ederiz.
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width) // pointee.x float --> float to int | burada ise sürükleyip bıraktığımızda page control current page simgesinin değişmesini sağladık
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) { // uygulama yatay mode'a (landscape mode) geçtiğinde collection view'in dikey moddaki gibi davranmasını sağlar
        
        // transition islemi gerceklestiginde ne olsun? tamamlandiginda ne olsun?
        coordinator.animate { (_) in
            self.collectionViewLayout.invalidateLayout() // tek bir item gorunur
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } completion: { (_) in
            
        }

        
        

    }
    
}
