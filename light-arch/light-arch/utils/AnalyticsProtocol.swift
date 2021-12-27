//
//  AnalyticsProtocol.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation

protocol AnalyticsProtocol {
    
    func logEvent(name: String, parameters: [String: Any]?)
    
    func logEvent(_ event: AnalyticsEvent, parameters: [AnalyticsAttribute: Any]?)
    
    func logEvent(_ event: AnalyticsEvent, parameters: [AnalyticsAttribute: AnalyticsValue]?)
    
    func setUserId(_ id: String)
    
    func setUserProperty(value: String?, forName name: String)
    
    func setScreen(_ screen: AnalyticsScreen)
    
    func logBackgroundWithLastScreen()
}
