//
//  GameViewController.swift
//  HelloSceneKitMacOS
//
//  Created by David Young-chan Kay on 2016-09-01.
//  Copyright (c) 2016 David Young-chan Kay. All rights reserved.
//

import SceneKit
import QuartzCore

class GameViewController: NSViewController {
    
    @IBOutlet weak var gameView: GameView!
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
        // create a new scene
        let scene = SceneFactory().makeBreastScene()
        
        // create and add a camera to the scene
        // let cameraNode = SCNNode()
        // cameraNode.camera = SCNCamera()
        // scene.rootNode.addChildNode(cameraNode)
        // 
        // // place the camera
        // cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeOmni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = NSColor.darkGrayColor()
        scene.rootNode.addChildNode(ambientLightNode)
        
        // set the scene to the view
        self.gameView!.scene = scene
        
        // allows the user to manipulate the camera
        self.gameView!.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        self.gameView!.showsStatistics = true
        
        // configure the view
        self.gameView!.backgroundColor = NSColor.blackColor()
    }

}
