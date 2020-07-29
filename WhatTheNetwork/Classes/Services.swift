//
//  Services.swift
//  ErrorManagment
//
//  Created by sadegh on 7/24/20.
//  Copyright © 2020 sadegh. All rights reserved.
//

import Foundation

public enum SerivceState {
    case release, test
}

public protocol ServicesAPIBehavior {
    
    static var testDomain: String { get }
    static var releaseDomain: String { get }
    static var state: SerivceState { get set }
    static var baseAddress: String { get }
    
    static func url(with endPath: String) -> URL
    static func middlePath(_ mid: String, endPath: String) -> URL
}

public extension ServicesAPIBehavior {
    
    static func url(with endPath: String) -> URL {
        return URL(string: baseAddress)!.appendingPathComponent(endPath)
    }
    
    static var baseAddress: String {
        switch state {
        case .release:
            return releaseDomain
        case .test:
            return testDomain
        }
    }
    
    static func middlePath(_ mid: String, endPath: String) -> URL {
        return URL(string: baseAddress)!.appendingPathComponent("\(mid)/\(endPath)")

    }

}

