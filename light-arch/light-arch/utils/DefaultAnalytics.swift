//
//  DefaultAnalytics.swift
//  clean-architecture
//
//  Created by Jaime Aranaz on 21/12/2021.
//

import Foundation

class DefaultAnalytics: AnalyticsProtocol {

    func logEvent(name: String, parameters: [String: Any]? = nil) {

    }
    
    func logEvent(_ event: AnalyticsEvent, parameters: [AnalyticsAttribute: Any]? = nil) {

    }
    
    func logEvent(_ event: AnalyticsEvent, parameters: [AnalyticsAttribute: AnalyticsValue]? = nil) {

    }
    
    func setUserId(_ id: String) {

    }
    
    func setUserProperty(value: String?, forName name: String) {

    }
    
    func setScreen(_ screen: AnalyticsScreen) {

    }
    
    func logBackgroundWithLastScreen() {

    }
}

