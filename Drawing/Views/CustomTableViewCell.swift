import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    let choseColor: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setchoseColorConstraints()
        setlabelConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setchoseColorConstraints(){
        self.addSubview(choseColor)
        NSLayoutConstraint.activate([
            choseColor.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            choseColor.heightAnchor.constraint(equalToConstant: 30),
            choseColor.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            choseColor.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            choseColor.widthAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    private func setlabelConstraints(){
        self.addSubview(label)
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: choseColor.rightAnchor, constant: 10),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            label.heightAnchor.constraint(equalTo: choseColor.heightAnchor)
            ])
    }
}
