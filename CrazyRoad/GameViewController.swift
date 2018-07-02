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
class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        setupFloor()
        setupCamera()
    }
    
    func setupScene() {
        sceneView = view as! SCNView
        scene = SCNScene()
        sceneView.scene = scene
        
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
        cameraNode.eulerAngles = SCNVector3(x:-.pi/2, y:0, z:0)
        scene.rootNode.addChildNode(cameraNode)
        
    }
    
    
    
}
