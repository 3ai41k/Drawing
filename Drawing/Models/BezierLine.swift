import UIKit

struct BezierLine {
    
    private let bezierPath = UIBezierPath()
    private var brushColor: UIColor
    
    init(startPoint: CGPoint, brushColor: UIColor) {
        self.bezierPath.move(to: startPoint)
        self.brushColor = brushColor
    }
    
    func setlineWidth(_ value: CGFloat) {
        bezierPath.lineWidth = value
    }
    
    func addLine(_ point: CGPoint) {
        bezierPath.addLine(to: point)
    }
    
    func stroke() {
        brushColor.setStroke()
        bezierPath.stroke()
    }
}
