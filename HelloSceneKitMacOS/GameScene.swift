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

        program.vertexFunctionName = "vertexPlane"
        program.fragmentFunctionName = "fragmentPlane"
        
        let sphere = SCNSphere(radius: 0.25)
        //let sphere = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
        
        var planeData = PlaneData(
            //plane: vector_float4(1,0,0,1)
            //plane: vector_float4(0,1,0,1)
            //plane: vector_float4(0,0,1,1)
            //plane: vector_float4(0, 0.7071, -0.7071, 0)
             plane: vector_float4(1,2,-4,7)
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
