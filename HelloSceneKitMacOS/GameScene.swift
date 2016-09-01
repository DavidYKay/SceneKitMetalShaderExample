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

struct MyAccentColors {
    var primaryColor: vector_float4
    var secondaryColor: vector_float4
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
        //sphere.materials.first!.diffuse.contents = NSColor.redColor()
        
//        var accentColor = MyAccentColors(
//            primaryColor: vector_float4(0,1,0,1),
//            secondaryColor: vector_float4(0,1,0,1)
//        )
        var myColor = MyColor(
            //color: vector_float4(0,1,0,1)
            //color: vector_float4(0,0,1,1)
            color: vector_float4(1,0,0,1)
        )
        let myData = NSData(bytes:&myColor, length:sizeof(MyColor))
        sphere.materials.first!.setValue(myData, forKey: "colors")

        sphere.materials.first!.program = program
        
        let node = SCNNode(geometry: sphere)
        self.rootNode.addChildNode(node)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
