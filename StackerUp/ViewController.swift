//
//  ViewController.swift
//  StackerUp
//
//  Created by Matt Lintlop on 7/4/18.
//  Copyright © 2018 Matt Lintlop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var stackviewPlaceholderView: UIView!
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackviewPlaceholderView.addSubview(scrollView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
        
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        scrollView.addSubview(stackView)
        
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["stackView": stackView]))
        
        for _ in 1 ..< 50 {
            let imageView = UIImageView(image: UIImage(named: "testPhoto"))
            stackView.addArrangedSubview(imageView)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
    }
}

