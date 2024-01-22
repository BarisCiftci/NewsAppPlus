//
//  NewsAppPlusApp.swift
//  NewsAppPlus
//
//  Created by Baris Ciftci on 19/01/2023.
//

import SwiftUI

@main
struct NewsAppPlusApp: App {
    var body: some Scene {
        WindowGroup {
            NewsView(selectedSource: Constant.SOURCES_TITLE)
        }
    }
}
