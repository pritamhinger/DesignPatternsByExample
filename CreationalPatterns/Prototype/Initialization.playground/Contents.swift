import Foundation
import UIKit

class Sum :NSObject, NSCopying{
    var resultCache: [[Int]]
    var firstValue: Int
    var secondValue: Int
    
    init(firstValue: Int, secondValue:Int) {
        resultCache = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 10)
        
        for i in 0..<10{
            for j in 0..<10{
                resultCache[i][j] = i + j
            }
        }
        
        self.firstValue = firstValue
        self.secondValue = secondValue
    }
    
    var Result:Int{
        get{
            return firstValue < resultCache.count && secondValue < resultCache[firstValue].count ? resultCache[firstValue][secondValue] : firstValue + secondValue
        }
    }
    
    private init(firstValue:Int, secondValue:Int, cache:[[Int]]) {
        self.firstValue = firstValue
        self.secondValue = secondValue
        resultCache = cache
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Sum(firstValue: self.firstValue, secondValue: self.secondValue, cache: self.resultCache)
    }
}

var prototype = Sum(firstValue: 0, secondValue: 9)
var calc1 = prototype.Result
var clone = prototype.copy() as! Sum
clone.firstValue = 3
clone.secondValue = 8
var calc2 = clone.Result