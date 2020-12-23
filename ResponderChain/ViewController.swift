//
//  ViewController.swift
//  ResponderChain
//
//  Created by sunsetwan on 2020/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewA = BaseView(nameText: "A", backgroundColor: .gray)
    private let viewB = BaseView(nameText: "B", backgroundColor: .pink)
    private let viewC = BaseView(nameText: "C", backgroundColor: .brown)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initViews()
        initLayouts()
    }

    
    private func initViews() {
        [viewA, viewC, viewB].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func initLayouts() {
        NSLayoutConstraint.activate([
            viewA.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewA.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            viewC.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewC.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            viewB.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewB.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            viewA.heightAnchor.constraint(equalToConstant: 300),
            viewA.widthAnchor.constraint(equalToConstant: 300),
            
            viewB.heightAnchor.constraint(equalToConstant: 100),
            viewB.widthAnchor.constraint(equalToConstant: 100),
            
            viewC.heightAnchor.constraint(equalToConstant: 200),
            viewC.widthAnchor.constraint(equalToConstant: 200),
        ])
    }

}

