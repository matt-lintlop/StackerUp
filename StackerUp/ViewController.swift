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
    
        for i in 1...20 {
            addView()
        }
    }
    
    fileprivate func addView() {
        let view = UIButton(type: .roundedRect)
        //           let view = UIButton(frame: CGRect(x: 0, y: 0, width: 74  , height: 74))
        view.widthAnchor.constraint(equalToConstant: 74).isActive = true
        view.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
        view.setTitle(String(stackView.arrangedSubviews.count+1), for: .normal)
        view.setTitleColor( UIColor.red, for: .normal)
        view.backgroundColor = UIColor.lightGray
        
        view.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        stackView.addArrangedSubview(view)
    }
    
    @IBAction func addViewPressed(_ sender: Any) {
        addView()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let duration = 0.25
        UIView.animate(withDuration: duration, animations: {
            sender.alpha = 0.0
            sender.isHidden = true
      }) { (finished) in
        self.stackView.layoutIfNeeded()
       }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
        print("viewDidLayoutSubviews: stack view size = ( \(stackView.frame.width) , \(stackView.frame.height) " )
    }
}

