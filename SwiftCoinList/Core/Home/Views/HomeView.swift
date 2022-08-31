//
//  HomeView.swift
//  SwiftCoinList
//
//  Created by Woo Min on 2022/08/30.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    //@StateObject 는 HomeViewModel에서 만든 네트워크 작업을 사용할 수 있게 해줍니다. 따로 공부필요!
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                // 상승률 순위
                TopMoversView()
                
                Divider() // 섹션나누는 선
                
                // 모든 코인
                AllCoinsView(viewModel: viewModel)
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
