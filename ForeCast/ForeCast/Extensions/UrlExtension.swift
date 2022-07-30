//
//  UrlExtension.swift
//  ForeCast
//
//  Created by user225360 on 7/30/22.
//
	
import Foundation

//TODO it does not work yet
//Remove white spaces
extension String {
    func setURL() -> String {
        self.replacingOccurrences(of: " ", with: "%20")
    }
}
