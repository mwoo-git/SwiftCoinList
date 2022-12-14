//
//  AllCoinsView.swift
//  SwiftCoinList
//
//  Created by Woo Min on 2022/08/30.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: HomeViewModel //함수를 가져옵니다.
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("코인 리스트")
                .font(.headline)
                .padding()
            
            HStack {
                Text("Coin")
                
                Spacer() // 중간에 간격
                
                Text("Prices")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            
            ScrollView {
                VStack {
                    ForEach(viewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    }
                    
                    //                    ForEach(viewModel.coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })) { coin in //받아온 코인갯수만큼 반복
                    
                    //                        CoinRowView(coin: coin)
                    //                    } //상승률 순위 정렬
                    
                    //                    ForEach(0 ..< 50, id: \.self) { _ in
                    //                        CoinRowView()
                    //                    } // 초기 빌드 할 때
                    
                }
            }
        }
    }
}

//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView()
//    }
//}
