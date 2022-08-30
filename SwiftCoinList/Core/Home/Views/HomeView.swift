//
//  HomeView.swift
//  SwiftCoinList
//
//  Created by Woo Min on 2022/08/30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                // 상승률 순위
                TopMoversView()
                
                Divider() // 섹션나누는 선
                
                // 모든 코인
                AllCoinsView()
            }
            .navigationTitle("실시간 가격")
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
