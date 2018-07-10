//
//  CollisionNode.swift
//  CrazyRoad
//
//  Created by Bryan Mansell on 10/07/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import SceneKit

class CollisionNode: SCNNode {
    
    let front: SCNNode
    let right: SCNNode
    let left: SCNNode
    
    override init() {
        front = SCNNode()
        right = SCNNode()
        left = SCNNode()
        
        super.init()
        createPhysicsBodies()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createPhysicsBodies() {
        
        let boxGeometry  = SCNBox(width: 0.25, height: 0.25, length: 0.25, chamferRadius: 0)
        
        boxGeometry.firstMaterial?.diffuse.contents = UIColor.blue
        
        let shape = SCNPhysicsShape(geometry: boxGeometry, options: [SCNPhysicsShape.Option.type: SCNPhysicsShape.ShapeType.boundingBox])
        
        front.geometry = boxGeometry
        right.geometry = boxGeometry
        left.geometry = boxGeometry
        
        front.physicsBody = SCNPhysicsBody(type: .kinematic, shape: shape)
        front.physicsBody?.categoryBitMask = PhysicsCategory.collisionTestFront
        front.physicsBody?.contactTestBitMask = PhysicsCategory.vegitation
        
        right.physicsBody = SCNPhysicsBody(type: .kinematic, shape: shape)
        right.physicsBody?.categoryBitMask = PhysicsCategory.collisionTestRight
        right.physicsBody?.contactTestBitMask = PhysicsCategory.vegitation
        
        left.physicsBody = SCNPhysicsBody(type: .kinematic, shape: shape)
        left.physicsBody?.categoryBitMask = PhysicsCategory.collisionTestLeft
        left.physicsBody?.contactTestBitMask = PhysicsCategory.vegitation
        
        front.position = SCNVector3(x:0, y:0.5, z: -1)
        right.position = SCNVector3(x:1, y:0.5, z: 0)
        left.position = SCNVector3(x: -1, y:0.5, z: 0)
        
        addChildNode(front)
        addChildNode(right)
        addChildNode(left)
        
    }

}
