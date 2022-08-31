//
//  HomeViewModel.swift
//  SwiftCoinList
//
//  Created by Woo Min on 2022/08/31.
//

import SwiftUI

class HomeViewModel: ObservableObject {
  
    // @stateOject 를 사용해서 함수 실행
    
    @Published var coins = [Coin]() //  models 폴더에 정의한 데이터 모델을 가져옵니다.
    @Published var topMovingCoins = [Coin]()
    
    init() {
        fetchCoinData() //해당 함수를 실행
    }
    
    func fetchCoinData() {
        // api 사이트에서 가져온 url
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        // guard let은 참이 아니면 else가 실행되는 문법 (옵셔널 바인딩)
        guard let url = URL(string: urlString) else { return }
        
        // dataTask, url로부터 요청하고 받을 때 사용 (영어설명 참고)
        URLSession.shared.dataTask(with: url) { data, response, error in
            // 에러 발생 시
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
            }
            
            // 응답이 정상적으로 되는지 (200(정상).. 400,500 비정상 등등)
            if let response = response as? HTTPURLResponse {
                print("DEBUG: Response code \(response.statusCode)")
            }
            
            // 데이터를 가져오면
            guard let data = data else { return }
            //let dataAsString = String(data: data, encoding: .utf8) // 데이터를 문자열로 변환
            //print("DEBUG: Data \(dataAsString)")
            
            //Json 정보를 디코딩하여 풀어서 받기
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async { // 메인쓰레드에서 순차적으로 실행해라
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
                //print("DEBUG: Coins \(coins)")
            } catch let error {
                print("DEBUG: Failed to decode with error: \(error)")
            }
            
        }.resume()
        //리슘은 작업이 중단된 경우 다시 시작합니다.
    }
    
    // 상승률 순위 정렬 함수
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        self.topMovingCoins = Array(topMovers.prefix(5)) //상위 5개만 가져옵니다.
    }
}
