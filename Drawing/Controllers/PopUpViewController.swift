import UIKit

class PopUpViewController: UIViewController {

    public weak var delegate: BrushDelegate?
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        label.font = label.font.withSize(30)
        label.text = "1"
        return label
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.setValue(1, animated: true)
        slider.addTarget(self, action: #selector(changeSliderValue), for: .valueChanged)
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabelConstraints()
        setSliderConstraints()
    }
    
    @objc
    func changeSliderValue(){
        let value = slider.value
        label.text = String(Int(value))
        delegate?.brushSize(value)
    }
    
    fileprivate func setLabelConstraints(){
        self.view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            label.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20)
            ])
    }
    
    fileprivate func setSliderConstraints(){
        self.view.addSubview(slider)
        NSLayoutConstraint.activate([
            slider.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            slider.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            slider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5),
            slider.topAnchor.constraint(equalTo: label.bottomAnchor)
            ])
    }
    
}

