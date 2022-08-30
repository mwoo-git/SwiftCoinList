//
//  AllCoinsView.swift
//  SwiftCoinList
//
//  Created by Woo Min on 2022/08/30.
//

import SwiftUI

struct AllCoinsView: View {
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
                    ForEach(0 ..< 50, id: \.self) { _ in
                        CoinRowView()
                    }
                }
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView()
    }
}
