//
//  GFG_AppApp.swift
//  GFG_App
//
//  Created by Khyati Dhawan on 01/03/22.
//

import SwiftUI

@main
struct GFG_App: App {
  
    var body: some Scene {
        let service = Service()
        WindowGroup {
            ContentView().environmentObject(service)
        }
    }
}
