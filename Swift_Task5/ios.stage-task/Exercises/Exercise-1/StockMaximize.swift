import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        if prices.count == 0 || prices.count == 1 { return 0 }
        var buy = [0, 0]
        var benefit = 0
        for i in 0..<prices.count {
            for j in i+1..<prices.count {
                let maxPrice = prices[j..<prices.count].max() ?? 0
                let maxIndex = prices.firstIndex(of: maxPrice) ?? 0
                if prices[i] >= maxPrice {
                    break
                }
                // просто покупаем
                if (prices[i] > prices[j] && prices[i] < maxPrice && i < maxIndex) ||
                    prices[i] < prices[j] && prices[j] < maxPrice && i < maxIndex {
                    buy[0] += 1
                    buy[1] += prices[i]
                }
                // покупаем и считаем выручку сразу
                else if prices[i] < prices[j] {
                    benefit += prices[j] - prices[i]
                    break
                }
                // продаём всё
                else if prices[i] == maxPrice {
                    benefit += (buy[0] * prices[j]) - (buy[0] * buy[1])
                }
            }
        }
        return benefit
    }
}
