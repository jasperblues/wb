////////////////////////////////////////////////////////////////////////////////
//
//  Freelancer
//  Copyright 2017 Freelancer
//  All Rights Reserved.
//
//  NOTICE: Prepared by Jasper Blues, on behalf of Freelancer
//
////////////////////////////////////////////////////////////////////////////////

import Foundation
import UIKit

class ProgramListController: UIViewController {

    let kCellIdentifier = "CellIdentifier"

    private(set) var client: WhatsBeefClient
    private(set) var assembly: ApplicationAssembly

    private(set) var loading: Bool = false

    var guide = Guide()

    @IBOutlet var itemsView: UITableView? {
        didSet {
            itemsView?.register(ProgramTableCell.self, forCellReuseIdentifier: kCellIdentifier)
            itemsView?.separatorStyle = .none
        }
    }

    public init(client: WhatsBeefClient, assembly: ApplicationAssembly) {
        self.client = client
        self.assembly = assembly
        super.init(nibName: "ListingView", bundle: .main)
        self.title = "My Movies"
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadIfNeeded()
    }

    func loadIfNeeded() {

        objc_sync_enter(self)

        let maxLoaded = guide.maxIndexPath
        let maxVisible = itemsView!.maxVisiblePlusOne()
        let result = maxVisible.compare(maxLoaded())

        if (!self.loading && result == ComparisonResult.orderedDescending) {

            self.loading = true
            itemsView?.reloadData()

            let start = guide.sections.count
            print("$$$$ Loading \(start)")
            client.load(start: start).then { (items) in
                self.processItems(items: items, title: self.titleForSection(section: start))
            }.catch { (error) in
                print("failed to load items - we'll just retry")
                self.loading = false
                self.loadIfNeeded()
            }
        }
        objc_sync_exit(self)
    }

    private func processItems(items: [Program], title: String) {
        print("$$$$$$$$$ process items")
        self.loading = false
        let section = Section(title: title, shows: items)
        guide.addIfRequired(section: section)
        self.itemsView?.reloadData()
    }

    private func titleForSection(section: Int) -> String {
        if (section == 0) {
            return "TONIGHT"
        }
        let today = Date()
        let date = Calendar.current.date(byAdding: .day, value: section, to: today)!

        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        return formatter.string(from: date)

    }

}

extension ProgramListController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return guide.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = guide.sections[section]
        return loading ? section.programs.count + 1 : section.programs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: ProgramTableCell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier) as! ProgramTableCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none

        let section = guide.sections[indexPath.section]
        let programs = section.programs

        if (indexPath == tableView.lastIndexPath) {
            cell.program = nil
        } else {
            if (programs.count > indexPath.row) {
                let program = programs[indexPath.row]
                cell.program = program
            }
        }
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = guide.sections[indexPath.section]
        let programs = section.programs

        if indexPath.row < programs.count {
            let show = programs[indexPath.row]
            self.navigationController?.pushViewController(assembly.detailController(show: show), animated: true)
        }
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = guide.sections[section]
        return section.title
    }


}

extension ProgramListController: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.loadIfNeeded()
    }

}
