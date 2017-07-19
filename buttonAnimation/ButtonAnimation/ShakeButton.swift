//
//  Shake+Button.swift
//  buttonAnimation
//
//  Created by 林 利樹 on 2017/07/18.
//  Copyright © 2017年 林 利樹. All rights reserved.
//

import Foundation
import UIKit

class shakeButton : UIButton {

    enum animType {
        case left
        case right
    }
    
    let animSpeedMaxCount = 6
    let animSpeedOffSetCount = 3
    
    var type : animType = .right
    var slopeRigt : CGFloat = 0
    var slopeLeft : CGFloat = 0
    var SpeedRandom : CGFloat = 0
    var animSpeed : CGFloat = 0.1
    
    //アニメーションスタート
    func  startShakeAnimation() {

        self.setUpShakeAnimation()
        self.shakeAnimation()
    }
    
    private func setUpShakeAnimation() {
        //アニメーションスピード調整
        let randmuCount = Int(arc4random_uniform(UInt32(self.animSpeedMaxCount))) - self.animSpeedOffSetCount
        self.animSpeed = 0.1
        self.SpeedRandom = CGFloat(randmuCount) / 100
        self.animSpeed += self.SpeedRandom
        //傾きの調整(右)
        self.slopeRigt = 2.0
        self.slopeRigt +=  CGFloat(randmuCount)
        //傾きの調整(左)
        self.slopeLeft = 358.0
        self.slopeLeft -=  CGFloat(randmuCount)
    }
    
    //ボタンのアニメーション
    private func shakeAnimation() {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(TimeInterval(self.animSpeed))
        UIView.setAnimationDelay(0.0)
        UIView.setAnimationRepeatCount(1e100)
        
        if (self.type == .right) {
            let rote : CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(self.slopeRigt * (.pi / 180.0)));
            self.transform = rote
            self.type = .left;
        } else {
            let rote : CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(self.slopeLeft * (.pi / 180.0)));
            self.transform = rote
            self.type = .right
        }
        
        UIView.commitAnimations()
    }
    
    //ボタンのアニメーション終了
    func stopShakeAnimation() {
        self.layer.removeAllAnimations();
    }
    
}
