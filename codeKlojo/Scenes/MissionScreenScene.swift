//
//  MissionScreenScene.swift
//  codeKlojo
//
//  Created by Tim Bartels on 12-12-16.
//  Copyright © 2016 Tim Bartels. All rights reserved.
//

import SpriteKit
import UIKit

class MissionScreenScene: SKScene, SceneManager {
    let level = MissionLevel()
    let sound = SKAudioNode(fileNamed: "find-the-exit.wav")
    
    
    override func sceneDidLoad() {
    }
    
    override func didMove(to view: SKView) {
        // Init background
        self.backgroundColor = SKColor(red: CGFloat(116.0/255.0), green: CGFloat(226.0/255.0), blue: CGFloat(207.0/255.0), alpha: 0)
        self.addChild(Background().load().first!)
        
        //Init textfield
        let textField = level.showTextEditor()
        self.view!.addSubview(textField)
        
        self.addChild(sound)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for view in (self.view?.subviews)!{
            view.removeFromSuperview()
        }
        loadScene(withIdentifier: .cityscreen)
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        
    }

}