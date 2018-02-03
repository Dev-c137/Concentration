//
//  theme.swift
//  Concentration
//
//  Created by Devang Pawar on 19/01/18.
//  Copyright © 2018 Thakur's. All rights reserved.
//

import Foundation
import UIKit

struct Theme{
    private let halloween = "👻🎃🦇🍭🍎😈🙀😱🍬👹"
    private let face = "🙂😎🤩😡😘😍🤢🤧😐😝"
    private let sports = "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸"
    private let animals = "🐶🐱🦄🐹🐼🐯🦁🐮🐷🐙"
    private let hearts = "❤️🧡💛💚💙💜🖤💔💖💝"
    private let flags = "🇮🇳🇺🇸🇬🇧🇬🇹🇫🇰🇫🇴🇨🇳🇦🇴🇩🇪🇱🇰"
    private let themeBackgrounds = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)]
    
    private var randomIndex: Int
    
    private static var randonIndexChooser = 0
    
    private static func chooseRandomIndex() -> Int{
        randonIndexChooser = Int(arc4random_uniform(UInt32(6)))
        return randonIndexChooser
    }
    
    var randomTheme: String{
        let themes = [halloween,face,sports,animals,hearts,flags]
        return themes[randomIndex]
    }
    var newBackground: UIColor{
        return themeBackgrounds[randomIndex]
    }
    
    init() {
        self.randomIndex = Theme.chooseRandomIndex()
    }
    
}
