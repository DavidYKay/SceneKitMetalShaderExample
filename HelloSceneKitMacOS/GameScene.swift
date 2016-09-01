//
//  GameScene.swift
//  HelloSceneKitMacOS
//
//  Created by David Young-chan Kay on 2016-09-01.
//  Copyright © 2016 David Young-chan Kay. All rights reserved.
//

import Foundation
import SceneKit
import Metal

class GameScene: SCNScene {

    override init() {
        super.init()
   
        let device = MTLCreateSystemDefaultDevice()!
        
        let library = device.newDefaultLibrary()
        let program = SCNProgram()
        program.library = library

        // let vertexFunc = library.newFunctionWithName("vertexMain")
        // let fragmentFunc = library.newFunctionWithName("flatColor")
        // program.vertexFunction = "vertexFunction"
        // program.fragmentFunction = fragmentFunction
        program.vertexFunctionName = "myVertex"
        program.fragmentFunctionName = "myFragment"

        let sphere = SCNSphere(radius: 1.0)
        //sphere.materials.first!.diffuse.contents = NSColor.redColor()

        // let material = sphere.materials.first!
        // material.diffuse.contents = UIColor.redColor()

        sphere.materials.first!.program = program

        let node = SCNNode(geometry: sphere)
        self.rootNode.addChildNode(node)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
