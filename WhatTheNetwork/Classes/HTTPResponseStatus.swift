//
//  ErrorManager.swift
//  ErrorManagment
//
//  Created by sadegh on 7/23/20.
//  Copyright © 2020 sadegh. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    
    // 1xx Informational response
    case `continue`
    case switchingProtocols
    case processing
    case earlyHint
    
    // 2xx Success
    case ok
    case created
    case accepeted
    case nonAuthoritativeInformation
    case noContent
    case resetContent
    case partialContent
    case multiStatus
    
    // 3xx Redirection
    case multipleChoices
    case movePermanently
    case found
    case notModified
    case useProxy
    case switchProxy
    case temporaryRedirect
    case permanentRedirect
    
    // 4xx Client errors
    case badRequest
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    case methodNotAllowed
    case notAcceptable
    case requestTimeout
    case conflict
    case gone
    case lengthRequired
    case preconditionFailed
    case payloudTooLarge
    case URITooLong
    case unsupportedMediaType
    case rangeNotSatisfiable
    case expectationFailed
    case tooEarly
    case upgradeReuquierd
    case preconditionRequired
    case tooManyReuqest
    case requestHeaderFieldsTooLarge
    case unavailbleForLegalReasons
    
    // 5xx Server errors
    case internalServer
    case notImplemented
    case badGateway
    case serviceUnavailable
    case gateawayTimeout
    case httpVersionNotSupported
    case variantNegotiates
    case loopDetedcted
    case notExtended
    case networkAuthenticationRequired
    
}
extension NetworkError {
    
    var statusCode: Int {
        switch self {
        //1xx Informational response
        case .`continue`: return 100
        case .switchingProtocols: return 101
        case .processing: return  102
        case .earlyHint: return  103
            
        // 2xx Success
        case .ok: return  200
        case .created: return  201
        case .accepeted: return  202
        case .nonAuthoritativeInformation: return 203
        case .noContent: return  204
        case .resetContent: return  205
        case .partialContent: return  206
        case .multiStatus: return  207
            
        // 3xx Redirection
        case .multipleChoices: return  300
        case .movePermanently: return  301
        case .found: return  302
        case .notModified: return  304
        case .useProxy: return  305
        case .switchProxy: return  306
        case .temporaryRedirect: return  307
        case .permanentRedirect: return  308
            
        // 4xx Client errors
        case .badRequest: return  400
        case .unauthorized: return  401
        case .paymentRequired: return  402
        case .forbidden: return  403
        case .notFound: return  404
        case .methodNotAllowed: return  405
        case .notAcceptable: return  406
        case .requestTimeout: return  408
        case .conflict: return  409
        case .gone: return  410
        case .lengthRequired: return  411
        case .preconditionFailed: return  412
        case .payloudTooLarge: return  413
        case .URITooLong: return  414
        case .unsupportedMediaType: return  415
        case .rangeNotSatisfiable: return  416
        case .expectationFailed: return  417
        case .tooEarly: return  425
        case .upgradeReuquierd: return  426
        case .preconditionRequired: return  428
        case .tooManyReuqest: return  429
        case .requestHeaderFieldsTooLarge: return  431
        case .unavailbleForLegalReasons: return  451
            
        // 5x.x Server errors
        case .internalServer: return  500
        case .notImplemented: return  501
        case .badGateway: return  502
        case .serviceUnavailable: return  503
        case .gateawayTimeout: return  504
        case .httpVersionNotSupported: return  505
        case .variantNegotiates: return  506
        case .loopDetedcted: return  508
        case .notExtended: return  510
        case .networkAuthenticationRequired: return  511
        }
    }
}

