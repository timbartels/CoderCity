//
//  Object.swift
//  codeKlojo
//
//  Created by Tim Bartels on 19-01-17.
//  Copyright © 2017 Tim Bartels. All rights reserved.
//

import Foundation
import SpriteKit

class Clouds: SKSpriteNode{
    func load(scene: SKScene, amount: Int){
        var positionX = 0
        for _ in 0...amount{
            let cloud = Clouds(imageNamed: "cloud.png")
            cloud.moveCloud(cloud: cloud)
            positionX += 200
            cloud.zPosition = -100
            cloud.position.x += CGFloat(positionX)
            scene.addChild(cloud)
        }
    }
    
    func moveCloud(cloud: SKSpriteNode){
        let yPosition = CGFloat(arc4random_uniform(200)+600)
        let xPosition = CGFloat(arc4random_uniform(6001))
        let scale = CGFloat(arc4random_uniform(35)+65)/100
        let randomScale = CGFloat(arc4random_uniform(2))
        
        cloud.anchorPoint = CGPoint(x: 1,y: 1)
        let moveCloudAction = SKAction.move(to: CGPoint(x: -500, y: yPosition), duration: Double(arc4random_uniform(90)+80))
        cloud.position.x = xPosition
        cloud.position.y = yPosition
        cloud.setScale(scale)
        if randomScale == 1.0{
            cloud.xScale = -1
        }
        cloud.run(SKAction.repeatForever(moveCloudAction))
        if cloud.position.x == 0{
            cloud.position.x = 6000
        }
        
    }
}
