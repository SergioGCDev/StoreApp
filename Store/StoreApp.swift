//
//  StoreApp.swift
//  Store
//
//  Created by Sergio García on 10/11/25.
//

import SwiftUI

@main
struct StoreApp: App {
    
    @StateObject private var vm = ProductVM() // Se crea la mochila con el ProductVM() dentro
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm) // Lo lleva implícito en el ContentView u otras Views.
        }
    }
}
