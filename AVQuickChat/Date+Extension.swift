//
//  File.swift
//  AVQuickChat
//
//  Created by Ashish Verma on 31/08/18.
//  Copyright © 2018 caffieneToCode. All rights reserved.
//
import Foundation

extension Date {
    static func dateFromString(string: String) -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        return dateFormater.date(from: string) ?? Date()
    }
}
