//
//  BaseView.swift
//  ResponderChain
//
//  Created by sunsetwan on 2020/12/23.
//

import UIKit

class BaseView: UIView {
    
    enum CustomColor {
        case gray
        case brown
        case pink
        
        var color: UIColor {
            switch self {
            case .gray:
                return UIColor.gray
            case .brown:
                return UIColor.brown
            case .pink:
                return UIColor.systemPink
            }
        }
        
        var description: String {
            switch self {
                case .gray:
                    return "gray"
                case .brown:
                    return "brown"
                case .pink:
                    return "pink"
            }
        }
    }
    
    private let nameLabel = UILabel()
    private var nameText: String!
    private var color: CustomColor!
    
    init(nameText: String, backgroundColor: CustomColor) {
        self.nameText = nameText
        super.init(frame: .zero)
        self.color = backgroundColor
        self.backgroundColor = backgroundColor.color
        initLabel()
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initLabel() {
        nameLabel.text = nameText
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .right
        nameLabel.textColor = .black
        
        addSubview(nameLabel)
    }
    
    private func initLayout() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        ])
    }
    
}

extension BaseView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        print("===========================")
        print("touchesBegan on \(color.description)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesMoved(touches, with: event)
        print("touchesMoved on \(color.description)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesEnded(touches, with: event)
        print("touchesEnded on \(color.description)")
        print("===========================")
    }
}
