//
//  ViewController.swift
//  MVVMBindings
//
//  Created by Андрей on 02.03.2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    private var viewModel = UserListViewModel()
    
    // MARK: - UI Elements
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "Cell"
        )
        return tableView
    }()
    
    // MARK: - Lifcyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.delegate = self
        tableView.dataSource = self
        fetchData()
        bindViewModel()
    }
}

// MARK: - Private functions
private extension ViewController {
    func bindViewModel() {
        viewModel.users.bind { [weak self] _ in
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data else { return }
            
            print(String(data: data, encoding: .utf8))
            
            do {
                let userModels = try JSONDecoder().decode([UserModel].self, from: data)
                
                self?.viewModel.users.value = userModels.compactMap ({
                    UserTableViewCellViewModel(name: $0.name)
                })
            } catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = viewModel.users.value?[indexPath.row]
        cell.textLabel?.text = user?.name
        return cell
    }
}
