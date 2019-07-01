import UIKit

class DrawingView: UIView {

    private var beganTranslation: CGPoint = CGPoint(x: 0, y: 0)
    
    private var pathColor = UIColor.black
    private var lineWidth = CGFloat(1.0)
    
    private var line: BezierLine?
    private var linesArr: Array<BezierLine> = []

    override func draw(_ rect: CGRect) {
        if !linesArr.isEmpty {
            for line in linesArr {
                line.stroke()
            }
        }
    }

    @IBAction
    public func didPan(recognizer: UIPanGestureRecognizer) {
        
        if recognizer.state == .began{
            beganTranslation = recognizer.location(in: self)
            line = BezierLine(startPoint: beganTranslation, brushColor: pathColor)
            line?.setlineWidth(lineWidth)
            linesArr.append(line!)
        }
        
        let translation = recognizer.translation(in: self)
        line?.addLine(CGPoint(x: translation.x + beganTranslation.x, y: translation.y + beganTranslation.y))
        self.setNeedsDisplay()
    }
}

extension DrawingView: BrushDelegate {
    func brushSize(_ value: Float) {
        lineWidth = CGFloat(value)
    }
    
    func brushColor(_ color: UIColor) {
        pathColor = color
    }
}
