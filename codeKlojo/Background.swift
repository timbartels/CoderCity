//
//  Background.swift
//  codeKlojo
//
//  Created by Tim Bartels on 10-11-16.
//  Copyright © 2016 Tim Bartels. All rights reserved.
//

import Foundation
import SpriteKit

class Background:SKSpriteNode {
    let repsonsive = Responsive()
    func load(){
        self.anchorPoint = CGPoint(x: 1,y: 0)
        self.position = CGPoint(x: 0, y: 0)
        self.size.height = repsonsive.getHeightScreen()
        self.zPosition = -99
    }
}
