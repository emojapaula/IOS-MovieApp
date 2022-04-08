//
//  UILabel.swift
//  MovieApp
//
//  Created by Paula on 06.04.2022..
//


import UIKit

extension UILabel {
    
    convenience init(text: String?, fontFamily: UIFont? = nil, color: UIColor? = nil) {
        self.init()
        
        guard let fullText = self.text, let target = text else {
            return
        }

        let attribText = NSMutableAttributedString(string: fullText)
        let range: NSRange = attribText.mutableString.range(of: target, options: .caseInsensitive)
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        if fontFamily != nil {
            attributes[.font] = fontFamily
        }
        if color != nil {
            attributes[.foregroundColor] = color
        }
        attribText.addAttributes(attributes, range: range)
        self.attributedText = attribText
        self.adjustsFontForContentSizeCategory = true

    }
}
