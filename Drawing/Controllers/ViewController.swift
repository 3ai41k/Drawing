import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorButton: UIButton! {
        didSet{
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didColorTap))
            tapGestureRecognizer.numberOfTapsRequired = 1
            colorButton.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @IBOutlet weak var brushSizeButton: UIButton! {
        didSet{
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didBrushSizeTap))
            tapGestureRecognizer.numberOfTapsRequired = 1
            brushSizeButton.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    @IBOutlet weak var drawingView: DrawingView!
    
    private let popBrushSizeViewController = PopUpViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc
    private func didColorTap(){
        let popColorViewController = PopUpTableViewController()
        popColorViewController.delegate = drawingView.self
        popColorViewController.modalPresentationStyle = .popover
        let popOverViewController = popColorViewController.popoverPresentationController
        popOverViewController?.delegate = self
        popOverViewController?.sourceView = self.colorButton
        popOverViewController?.sourceRect = CGRect(x: self.colorButton.bounds.midX, y: self.colorButton.bounds.minY, width: 0, height: 0)
        self.present(popColorViewController, animated: true)
    }
    
    @objc
    private func didBrushSizeTap(){
        popBrushSizeViewController.delegate = drawingView.self
        popBrushSizeViewController.modalPresentationStyle = .popover
        let popOverViewController = popBrushSizeViewController.popoverPresentationController
        popOverViewController?.delegate = self
        popOverViewController?.sourceView = self.brushSizeButton
        popOverViewController?.sourceRect = CGRect(x: self.brushSizeButton.bounds.midX, y: self.brushSizeButton.bounds.minY, width: 0, height: 0)
        popBrushSizeViewController.preferredContentSize = CGSize(width: 250, height: 100)
        self.present(popBrushSizeViewController, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

