//
//  StringExt.swift
//  PQPen
//
//  Created by Youzige on 2020/1/7.
//  Copyright © 2020 Ningqu. All rights reserved.
//

import UIKit

extension String {
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    func isLaterThan(_ version: String?) -> Bool {
        guard let version = version, isNotEmpty, version.isNotEmpty else { return false }
        let result = self.compare(version)
        if hasPrefix(version + ".") {
            return true
        } else if version.hasPrefix(self + ".") {
            return true
        }
        return result == .orderedDescending
    }
    
    mutating func append(path components: String) {
        if self.hasSuffix("/") {
            self += components
        } else {
            if components.hasPrefix("/") {
                self += components
            } else {
                self += "/\(components)"
            }
        }
    }
    
    static func width(text: String, fontSize: CGFloat) -> CGFloat {
        let size = CGSize(width: 5000, height: fontSize)
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes = [NSAttributedString.Key.font: font]
        let labelSize = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return labelSize.width
    }
    
    
    static func height(text: String,width:CGFloat , fontSize: CGFloat) -> CGFloat {
        let size = CGSize(width: width, height: 5000)
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes = [NSAttributedString.Key.font: font]
        let labelSize = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return labelSize.height
    }
    
    func width(fontSize:CGFloat) -> CGFloat {
        String.width(text: self, fontSize: fontSize)
    }
    
    func mac() -> String {
        if count == 17, components(separatedBy: ":").count == 6 {
            return self
        }
        if components(separatedBy: ":").count > 1 {
            return self
        }
        if isEmpty {
            return ""
        }
        let ext = max(0, self.count - 12)
        var string = self.dropLast(ext)
        if string.count % 2 == 1 {
            string.insert("0", at: self.startIndex)
        }
        var bits = [Substring]()
        while string.count > 0 {
            bits.append(string.prefix(2))
            string = string.dropFirst(2)
        }
        
        return bits.joined(separator: ":").uppercased()
    }
    
    func trim() -> String {
        let set = NSCharacterSet.whitespacesAndNewlines
        return self.trimmingCharacters(in: set)
    }
    
}

extension Optional where Wrapped == String {
    
    var isEmpty: Bool {
        return self?.isEmpty ?? true
    }
    
    var isNotEmpty: Bool {
        return self?.isNotEmpty ?? false
    }
    
    func isLaterThan(_ version: String?) -> Bool {
        return self?.isLaterThan(version) ?? false
    }
}
