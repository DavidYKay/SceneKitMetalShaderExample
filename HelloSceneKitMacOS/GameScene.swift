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

struct MyColor {
    var color: vector_float4
}

struct PlaneData {
    var plane: vector_float4
}

class GameScene: SCNScene {

    override init() {
        super.init()
   
        let device = MTLCreateSystemDefaultDevice()!

        let library = device.newDefaultLibrary()
        let program = SCNProgram()
        program.library = library

        program.vertexFunctionName = "myVertex"
        program.fragmentFunctionName = "fragmentAccent"
        
        let sphere = SCNSphere(radius: 1.0)
        
        var planeData = PlaneData(
            //color: vector_float4(1,0,0,1)
            plane: vector_float4(0,1,0,1)
            //color: vector_float4(0,0,1,1)
        )
        let myData = NSData(bytes:&planeData, length:sizeof(PlaneData))
        sphere.materials.first!.setValue(myData, forKey: "planeData")

        sphere.materials.first!.program = program
        
        let node = SCNNode(geometry: sphere)
        self.rootNode.addChildNode(node)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
