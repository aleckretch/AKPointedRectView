//
//  AKPointedRectView.swift
//
//  Created by Alec Kretch on 4/15/17.
//  Copyright © 2017 Alec Kretch. All rights reserved.
//

import UIKit

class AKPointedRectView : UIView {
    
    enum TrianglePosition {
        case top
        case right
        case bottom
        case left
    }
    
    var triangleHeight = CGFloat()
    var color = UIColor()
    var trianglePosition = TrianglePosition.top
    var cornerRadius = CGFloat(0.0)
    
    init(frame: CGRect, color: UIColor, triangleHeight: CGFloat, trianglePosition: TrianglePosition) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        self.triangleHeight = triangleHeight
        self.color = color
        self.trianglePosition = trianglePosition
    }
    
    convenience init(frame: CGRect, color: UIColor, triangleHeight: CGFloat, trianglePosition: TrianglePosition, cornerRadius: CGFloat) {
        self.init(frame: frame, color: color, triangleHeight: triangleHeight, trianglePosition: trianglePosition)
        clipsToBounds = true
        self.cornerRadius = cornerRadius
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        // Set values
        let triangleBottomLegHalfWidth = triangleHeight/1.73205080757 //30-60-90 triangle legs length formula where 1.73 = cubed root of 3
        var bodyOriginX = CGFloat(rect.origin.x)
        var bodyOriginY = CGFloat(rect.origin.y)
        var bodyWidth = rect.size.width
        var bodyHeight = rect.size.height
        var trianglePointAttached1 = CGPoint(x: 0, y: 0)
        var trianglePointAttached2 = CGPoint(x: 0, y: 0)
        var trianglePointDetached = CGPoint(x: 0, y: 0)
        if (trianglePosition == TrianglePosition.top) {
            bodyOriginY = triangleHeight
            bodyHeight = rect.size.height - triangleHeight
            trianglePointAttached1 = CGPoint(x: (rect.size.width/2)-triangleBottomLegHalfWidth, y: triangleHeight)
            trianglePointAttached2 = CGPoint(x: (rect.size.width/2)+triangleBottomLegHalfWidth, y: triangleHeight)
            trianglePointDetached = CGPoint(x: rect.size.width/2, y: rect.origin.y)
        } else if (trianglePosition == TrianglePosition.right) {
            bodyWidth = rect.size.width - triangleHeight
            trianglePointAttached1 = CGPoint(x: rect.size.width-triangleHeight, y: (rect.size.height/2)-triangleBottomLegHalfWidth)
            trianglePointAttached2 = CGPoint(x: rect.size.width-triangleHeight, y: (rect.size.height/2)+triangleBottomLegHalfWidth)
            trianglePointDetached = CGPoint(x: rect.size.width, y: rect.size.height/2)
            
        } else if (trianglePosition == TrianglePosition.bottom) {
            bodyHeight = rect.size.height - triangleHeight
            trianglePointAttached1 = CGPoint(x: (rect.size.width/2)-triangleBottomLegHalfWidth, y: rect.size.height-triangleHeight)
            trianglePointAttached2 = CGPoint(x: (rect.size.width/2)+triangleBottomLegHalfWidth, y: rect.size.height-triangleHeight)
            trianglePointDetached = CGPoint(x: rect.size.width/2, y: rect.size.height)
            
        } else if (trianglePosition == TrianglePosition.left) {
            bodyOriginX = triangleHeight
            bodyWidth = rect.size.width - triangleHeight
            trianglePointAttached1 = CGPoint(x: triangleHeight, y: (rect.size.height/2)-triangleBottomLegHalfWidth)
            trianglePointAttached2 = CGPoint(x: triangleHeight, y: (rect.size.height/2)+triangleBottomLegHalfWidth)
            trianglePointDetached = CGPoint(x: rect.origin.x, y: rect.size.height/2)
            
        }
        
        // Set context
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.beginPath()
        context.move(to: trianglePointAttached1)
        context.addLine(to: trianglePointAttached2)
        context.addLine(to: trianglePointDetached)
        context.closePath()
        context.setFillColor(color.cgColor)
        let bodyRect = CGRect(x: bodyOriginX, y: bodyOriginY, width: bodyWidth, height: bodyHeight)
        if (cornerRadius > 0.0) {
            let bezierPath:CGPath = UIBezierPath(roundedRect: bodyRect, cornerRadius: cornerRadius).cgPath
            context.addPath(bezierPath)
            context.fillPath()
        } else {
            context.fillPath()
            context.fill(bodyRect)
        }
    }
}
