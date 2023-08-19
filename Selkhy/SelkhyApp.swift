//
//  SelkhyApp.swift
//  Selkhy
//
//  Created by Kyubo Shim on 2023/08/19.
//

import SwiftUI

@main
struct SelkhyApp: App {
    init() {
        //네비게이션바 색, 백버튼 색 설정
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor(Color.Background)
        navigationBarAppearance.shadowColor = UIColor(Color.Background)
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    }
    var body: some Scene {
        WindowGroup {
//            HomeView()
            OrderView(menu: mockMenus[0])
        }
    }
}
