//
//  MainViewModel.swift
//  PointoApp
//
//  Created by Ekrem Özkaraca on 29.10.2022.
//

import UIKit

class MainViewModel: NSObject {
    private var resultObjects : [ResultObjects] = []
    var didDataFetched : (Bool) -> () = {isFetched in }
    func fetchData () {
        WebService.shared.getHomePageData { response in
            switch response {
            case .success(let data):
                guard let data = data.result, let content = data.resultObject else {
                    return
                }
                self.resultObjects = content
                self.didDataFetched(true)
            case .failure(let error):
                self.didDataFetched(false)
                print(error.localizedDescription)
            }
        }
    }
    
    func configureTable(table : UITableView) {
        table.delegate = self
        table.dataSource = self
        table.register(MainTableViewCell.nib(), forCellReuseIdentifier: MainTableViewCell.identifier)
    }
}

extension MainViewModel : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        
        mainCell.loadData(data: resultObjects[indexPath.row])
        return mainCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
}
