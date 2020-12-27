//
//  ViewController.swift
//  ResponderChain
//
//  Created by sunsetwan on 2020/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    var completionHandlers = [() -> Void]()
    
    var handler: () -> Void = {
        print("This is escaping closure")
    }
    
    func afterFinished(text: String, handler: @escaping () -> Void) {
        print(text)
//        handler()
        completionHandlers.append(handler)
    }
    
    private let viewA = BaseView(nameText: "A", backgroundColor: .gray)
//    private let viewB = BaseView(nameText: "B", backgroundColor: .pink)
    private let viewC = BaseView(nameText: "C", backgroundColor: .brown)
    
    private let viewB: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemPink
        
        // UIButton 的 target 为 nil，此时会利用 responder chain 来寻找一个实现了 myCustomMethod 的 object
        button.addTarget(nil, action: #selector(myCustomMethod), for: .touchUpInside)
        button.setTitle("B", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initViews()
        initLayouts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("view frame: \(view.frame)")
        print(viewB.responderChain())
    }
        
    private func initViews() {
        [viewA, viewC, viewB].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        viewA.addSubview(viewC)
        viewC.addSubview(viewB)
        view.addSubview(viewA)
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


extension ViewController {
    @objc func myCustomMethod() {
        print("SwiftRocks!")
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesBegan on superview")
//        super.touchesBegan(touches, with: event)
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesMoved on superview")
//        super.touchesMoved(touches, with: event)
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesEnded on superview")
//        super.touchesEnded(touches, with: event)
//    }
}

