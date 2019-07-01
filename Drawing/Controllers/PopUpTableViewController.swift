import UIKit

class PopUpTableViewController: UITableViewController {

    public weak var delegate: BrushDelegate?
    private let arrOfColors: Array<Brush> = [Brush(colorName: "Balck", color: UIColor.black),
                                             Brush(colorName: "Red", color: UIColor.red),
                                             Brush(colorName: "Yellow", color: UIColor.yellow),
                                             Brush(colorName: "Green", color: UIColor.green),
                                             Brush(colorName: "Blue", color: UIColor.blue)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "custom")
    }
    
    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: 150, height: tableView.contentSize.height)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfColors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as? CustomTableViewCell else { return UITableViewCell() }
        let brushes = arrOfColors[indexPath.row]
        cell.label.text = brushes.colorName
        cell.choseColor.backgroundColor = brushes.color
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let brushes = arrOfColors[indexPath.row]
        delegate?.brushColor(brushes.color)
        dismiss(animated: true, completion: nil)
    }
    
}
