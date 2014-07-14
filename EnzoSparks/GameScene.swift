//
//  GameScene.swift
//  EnzoSparks
//
//  Created by Enio Ohmaye on 7/14/14.
//  Copyright (c) 2014 Enio Ohmaye. All rights reserved.
//

import SpriteKit

extension SKEmitterNode {
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */

     
            let action1 = SKAction.rotateByAngle(360, duration: 1.5)
            runAction(action1)
        
    }
}

class GameScene: SKScene {
    
    func getFireFliesEmitter() -> SKEmitterNode {
        let path = NSBundle.mainBundle().pathForResource("FireFlies", ofType: "sks")
        let emitterNode : SKEmitterNode? = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? SKEmitterNode
        return emitterNode!;
    }
    
    override func didMoveToView(view: SKView) {
        
        /* Add FireFlies particle emitter */
        let fireFlies = getFireFliesEmitter()
            fireFlies.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
            fireFlies.name = "fireFlies"
            self.addChild(fireFlies)
        
        
        /* Setup your scene here */
        /*
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Enzo!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
        */
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = self.childNodeWithName("fireFlies")
            
            //sprite.xScale = 0.5
            //sprite.yScale = 0.5
            //sprite.position = location
            
            let action = SKAction.moveTo(location, duration: 1.0)
            
            sprite.runAction(action)
            
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
