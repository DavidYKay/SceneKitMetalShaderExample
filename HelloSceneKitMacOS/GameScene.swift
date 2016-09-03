//
//  GameScene.swift
//  HelloSceneKitMacOS
//
//  Created by David Young-chan Kay on 2016-09-01.
//  Copyright © 2016 David Young-chan Kay. All rights reserved.
//

import Foundation
import Metal
import ModelIO
import SceneKit.ModelIO
import SceneKit

struct PlaneData {
    var plane: vector_float4
}

public class FilePather {
    public func urlForFile(filename: String, filetype: String) -> NSURL {
        let bundle = NSBundle.mainBundle()  
        let path = bundle.pathForResource(filename, ofType: filetype)  
        return NSURL(fileURLWithPath: path!)  
    }
}

class SceneFactory {
    func makeObjScene(objUrl: NSURL) -> SCNScene {
        let scene = SCNScene(MDLAsset: MDLAsset(URL: objUrl))
        return scene
    }

    func makeNewScene() -> SCNScene {
        let monaUrl = FilePather().urlForFile("Mona", filetype: "obj")
        let scene = makeObjScene(monaUrl)
        let rootNode = scene.rootNode
        setShaderProgramAndData(rootNode.childNodes.first!.geometry!.materials.first!)
        return scene
    }

    func makeBreastScene() -> SCNScene {
        return makeNewScene()
    }
}

func setShaderProgramAndData(material: SCNMaterial) {
    let device = MTLCreateSystemDefaultDevice()!
    let library = device.newDefaultLibrary()
    let program = SCNProgram()
    program.library = library

    program.vertexFunctionName   = "vertexPlane"
    program.fragmentFunctionName = "fragmentPlane"

    var planeData = PlaneData(
            //plane: vector_float4(0, 0.7071, -0.7071, 0)
            plane: vector_float4(1,2,-4,7)
                        )

    let myData = NSData(bytes:&planeData, length:sizeof(PlaneData))
    material.setValue(myData, forKey: "planeData")
    material.program = program
}

