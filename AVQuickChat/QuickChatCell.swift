//
//  QuickChatCell.swift
//  AVQuickChat
//
//  Created by Ashish Verma on 31/08/18.
//  Copyright © 2018 caffieneToCode. All rights reserved.
//

import UIKit

class QuickChatCell: UITableViewCell {
    
    let messageBackgroundView = UIView()
    let messageLabel = UILabel()
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var quickChatMessage : QuickChatMessage! {
        
        didSet {
            messageBackgroundView.backgroundColor = quickChatMessage.isIncoming ? .white : #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            messageLabel.textColor = quickChatMessage.isIncoming ? .black : .black
            messageLabel.text = quickChatMessage.text

            if quickChatMessage.isIncoming {
//                messageBackgroundView.round(corners: [.topLeft, .topRight, .bottomRight], radius: 12)
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
//                messageBackgroundView.round(corners: [.topLeft, .topRight, .bottomLeft], radius: 12)
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        
        // Configuring and adding messageBackgroundView to the cell
        addSubview(messageBackgroundView)
        messageBackgroundView.layer.cornerRadius = 12.0
        // Configuring and adding messageLabel to the cell
        addSubview(messageLabel)
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont(name: "AvenirNext-Regular", size: 16)

        // Making and activating constraints
        messageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            messageBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            messageBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            messageBackgroundView.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            messageLabel.topAnchor.constraint(equalTo: messageBackgroundView.topAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: messageBackgroundView.trailingAnchor, constant: -16),
            messageLabel.bottomAnchor.constraint(equalTo: messageBackgroundView.bottomAnchor, constant: -16),
            messageLabel.leadingAnchor.constraint(equalTo: messageBackgroundView.leadingAnchor, constant: 16)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        leadingConstraint = messageBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        trailingConstraint = messageBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
