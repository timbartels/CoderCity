//
//  GameViewController.swift
//  codeKlojo
//
//  Created by Tim Bartels on 08-11-16.
//  Copyright © 2016 Tim Bartels. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if #available(iOS 10.0, *) {
            if let scene = GKScene(fileNamed: "StartScreenScene") {
                
                // Get the SKScene from the loaded GKScene
                if let sceneNode = scene.rootNode as! StartScreenScene? {
                    
                    // Present the scene
                    if let view = self.view as! SKView? {
                        
                        sceneNode.scaleMode = SKSceneScaleMode.resizeFill
                        view.presentScene(sceneNode)
                        
                        view.ignoresSiblingOrder = true
                        view.showsFPS = true
                        view.showsNodeCount = true
                    }
                }
            }
        } else {
            // Fallback on earlier versions
            let scene = SKScene(fileNamed: "StartScreenScene")
            // Set the scale mode to scale to fit the window
            scene?.scaleMode = .aspectFill
            
            // Present the scene
            if let view = self.view as! SKView? {
                
                scene?.scaleMode = SKSceneScaleMode.resizeFill
                view.presentScene(scene)
                
                view.ignoresSiblingOrder = true
                view.showsFPS = true
                view.showsNodeCount = true
            }

        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
