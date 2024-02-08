//
//  IntentViewController.swift
//  SiriKitExampleIntentUI
//
//  Created by Deisy Melo on 2/02/24.
//

import IntentsUI

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    
    @IBOutlet weak var tableView: UITableView!
    private var itemsList: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        itemsList = CoreDataManager().getItems()
    }
    
     
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        completion(true, parameters, self.desiredSize)
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}

extension IntentViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemsList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as UITableViewCell
            let item = itemsList[indexPath.row]
            cell.textLabel?.text = item.title
            return cell
        }
}
