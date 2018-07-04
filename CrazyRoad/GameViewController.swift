//
//  GameViewController.swift
//  CrazyRoad
//
//  Created by Bryan Mansell on 02/07/2018.
//  Copyright © 2018 Bryan Mansell. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

var scene : SCNScene!
var sceneView : SCNView!
var cameraNode = SCNNode()
var lightNode = SCNNode()
var mapNode = SCNNode()
var lanes = [LaneNode]()
var laneCount = 0

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        setupFloor()
        setupCamera()
        setupLight()
    }
    
    func setupScene() {
        sceneView = view as! SCNView
        scene = SCNScene()
        sceneView.scene = scene
        
        scene.rootNode.addChildNode(mapNode)
        for _ in 0..<20 {
            let type =  randomBool(odds: 3) ? LaneType.grass : LaneType.road
            let lane = LaneNode(type: type, width: 21)
            lane.position = SCNVector3(x: 0, y:0, z:5 - Float(laneCount))
            laneCount += 1
            lanes.append(lane)
            mapNode.addChildNode(lane)
        }
        
    }
    
    
    func setupFloor(){
        let floor = SCNFloor()
        floor.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/darkgrass.png")
        floor.firstMaterial?.diffuse.wrapS = .repeat
        floor.firstMaterial?.diffuse.wrapT = .repeat
        floor.firstMaterial?.diffuse.contentsTransform = SCNMatrix4MakeScale(12.5, 12.5, 12.5)
        floor.reflectivity = 0.0
        let floorNode = SCNNode(geometry: floor)
        scene.rootNode.addChildNode(floorNode)
        
    }
    
    func setupCamera() {
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 10, z:0)
        cameraNode.eulerAngles = SCNVector3(x:-toRadians(angle: 72), y:toRadians(angle: 9), z:0)
        scene.rootNode.addChildNode(cameraNode)
        
    }
    
    func setupLight() {
        
        let ambientNode = SCNNode()
        ambientNode.light = SCNLight()
        ambientNode.light?.type = .ambient
        let directionalNode = SCNNode()
        directionalNode.light = SCNLight()
        directionalNode.light?.type = .directional
        directionalNode.light?.castsShadow = true
        directionalNode.light?.shadowColor = UIColor(red:0.4, green:0.4, blue:0.4, alpha:1)
        directionalNode.position = SCNVector3(x:-5, y:5, z:0)
        directionalNode.eulerAngles = SCNVector3(x:0, y:-toRadians(angle: 90), z:-toRadians(angle: 45))
        lightNode.addChildNode(ambientNode)
        lightNode.addChildNode(directionalNode)
        lightNode.position = cameraNode.position
        scene.rootNode.addChildNode(lightNode)
    }
    
}
