//
//  MenuScene.swift
//  DemoGame
//
//  Created by Jonas Mock on 30.06.18.
//  Copyright © 2018 Jonas Mock. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(displayP3Red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        addLogo()
        addLabels()
    }
    
    func addLogo() {
        let logoo: SKSpriteNode!
        logoo = SKSpriteNode(imageNamed: "logo")
        logoo.size = CGSize(width: frame.size.width/1.5, height: frame.size.width/1.5)
        logoo.position = CGPoint(x: frame.midX, y: frame.maxY - logoo.size.height/1.25)
        addChild(logoo)
    }
    
    func addLabels() {
        let playlabel = SKLabelNode(text: "Tap to Play!")
        playlabel.fontName = "AvenirNext-Bold"
        playlabel.fontSize = 60.0
        playlabel.fontColor = UIColor.white
        playlabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playlabel)
        animate(label: playlabel)
        
        let highscoreLabel = SKLabelNode(text: "Highscore: "+"\(UserDefaults.standard.integer(forKey: "Highscore"))")
        highscoreLabel.fontName = "AvenirNext-Bold"
        highscoreLabel.fontSize = 40.0
        highscoreLabel.fontColor = UIColor.white
        highscoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - highscoreLabel.frame.size.height*4)
        addChild(highscoreLabel)
        
        let recentScoreLabel = SKLabelNode(text: "Recent Score: "+"\(UserDefaults.standard.integer(forKey: "RecentScore"))")
        recentScoreLabel.fontName = "AvenirNext-Bold"
        recentScoreLabel.fontSize = 40.0
        recentScoreLabel.fontColor = UIColor.white
        recentScoreLabel.position = CGPoint(x: frame.midX, y: highscoreLabel.position.y - recentScoreLabel.frame.size.height*2)
        addChild(recentScoreLabel)
    }
    
    func animate(label: SKLabelNode) {
       // let fadeOut = SKAction.fadeOut(withDuration: 0.5)
       // let fadeIn = SKAction.fadeIn(withDuration: 0.5)
        
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.5)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.5)
        
        let sequence = SKAction.sequence([scaleUp,scaleDown])
        label.run(SKAction.repeatForever(sequence))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: view!.bounds.size)
        view!.presentScene(gameScene)
    }

}
