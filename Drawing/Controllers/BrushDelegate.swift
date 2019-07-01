import UIKit

protocol BrushDelegate: class {
    func brushSize(_ value: Float) -> Void
    func brushColor(_ color: UIColor) -> Void
}
