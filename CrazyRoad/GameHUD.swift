//
//  GameHUD.swift
//  CrazyRoad
//
//  Created by Bryan Mansell on 11/07/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SpriteKit

class GameHUD: SKScene {
    
    var logoLabel: SKLabelNode?
    var tapToPlayLabel: SKLabelNode?
    var pointsLabel: SKLabelNode?


    init(with size: CGSize, menu: Bool) {
        super.init(size: size)
        if menu {
            addMenuLabel()
        }
        else {
            addPointsLabel()
        }
    }
    
    func addMenuLabel() {
        logoLabel = SKLabelNode(fontNamed: "8BIT WONDER Nominal")
        tapToPlayLabel = SKLabelNode(fontNamed: "8BIT WONDER Nominal")
        guard let logoLabel = logoLabel, let tapToPlayLabel = tapToPlayLabel else { return }
        logoLabel.text = "Crazy Road"
        logoLabel.fontSize = 35.0
        logoLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(logoLabel)
        
        tapToPlayLabel.text = "Tap to play"
        tapToPlayLabel.fontSize = 25.0
        tapToPlayLabel.position = CGPoint(x: frame.midX, y: frame.midY - logoLabel.frame.size.height)
        addChild(tapToPlayLabel)
    }
    
    func addPointsLabel() {
        
       pointsLabel = SKLabelNode(fontNamed: "8BIT WONDER Nominal")
        guard let pointsLabel = pointsLabel else { return }
        pointsLabel.text = "0"
        pointsLabel.fontSize = 40.0
        pointsLabel.position = CGPoint(x: frame.minX + pointsLabel.frame.size.width, y: frame.maxY - pointsLabel.frame.size.height * 2)
        addChild(pointsLabel)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    
    }
}
