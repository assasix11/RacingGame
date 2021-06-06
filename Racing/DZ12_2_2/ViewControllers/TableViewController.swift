//
//  TableViewController.swift
//  RacingSwift
//
//  Created by Дмитрий Зубарев on 05.06.2021.
//

import UIKit

class TableViewController: UIViewController {
    var massiveOfResults = [ResultsOfRace]()
    var sortedMassive = [ResultsOfRace]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let table = UITableView(frame: CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100))
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        view.addSubview(table)
        view.backgroundColor = .white
        buildInterface()
        addResultsToMassive()
       
        
    }
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    func buildInterface() {
        let label = UILabel(frame: CGRect(x: 20, y: 70, width: 200, height: 50))
        label.text = "Результаты"
        label.font = .systemFont(ofSize: 30)
        view.addSubview(label)
        let buttonBack = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 120, y: 70, width: 100, height: 50))
        buttonBack.setTitle("Назад", for: .normal)
        buttonBack.layer.cornerRadius = 25
        buttonBack.backgroundColor = .black
        let tap = UITapGestureRecognizer(target: self, action: #selector(back))
        buttonBack.addGestureRecognizer(tap)
        view.addSubview(buttonBack)
    }
    func addResultsToMassive() {
        let manager = FileManager()
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        print(url)
        let newFolderUrl = url.appendingPathComponent("racingResults")
        do {
            let filesInDirectory = try FileManager.default.contentsOfDirectory(atPath: newFolderUrl.path)
            for item in filesInDirectory {
                let itemPath = newFolderUrl.appendingPathComponent(item)
                let savedData = try Data(contentsOf: itemPath)
                let decodableDataOfResults = decoderData(data: savedData)
                massiveOfResults.append(decodableDataOfResults)
            }
        } catch {
            print("cant read the files in racingResults")
        }
            sortedMassive = massiveOfResults.sorted { $0.time > $1.time }
    }
    func decoderData (data: Data) -> ResultsOfRace {
        let decoder = JSONDecoder()
        guard let decodableResults =  try? decoder.decode(ResultsOfRace.self, from: data) else {
            fatalError()
        }
        return decodableResults
    }
}

extension TableViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel!.text = "Лучшее время " + String(sortedMassive[indexPath.row].time) + "       " + String(sortedMassive[indexPath.row].date)
        } else {
        cell.textLabel!.text = "Время " + String(sortedMassive[indexPath.row].time) + "       " + String(sortedMassive[indexPath.row].date)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(75)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedMassive.count
    }
}
