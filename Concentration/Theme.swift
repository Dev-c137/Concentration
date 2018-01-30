//
//  theme.swift
//  Concentration
//
//  Created by Devang Pawar on 19/01/18.
//  Copyright © 2018 Thakur's. All rights reserved.
//

import Foundation

struct Theme{
    private let halloween = "👻🎃🦇🍭🍎😈🙀😱🍬👹"
    private let face = "🙂😎🤩😡😘😍🤢🤧😐😝"
    private let sports = "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸"
    private let animals = "🐶🐱🦄🐹🐼🐯🦁🐮🐷🐙"
    private let hearts = "❤️🧡💛💚💙💜🖤💔💖💝"
    private let flags = "🇮🇳🇺🇸🇬🇧🇬🇹🇫🇰🇫🇴🇨🇳🇦🇴🇩🇪🇱🇰"
    
    
    mutating func selectTheme()->String{
        let themes = [halloween,face,sports,animals,hearts,flags]
        let randomThemeIndex = themes.index(themes.startIndex, offsetBy: themes.count.arc4random)
        return themes[randomThemeIndex]
    }
}
