

import UIKit

class ImageDetailTableView: BaseTableView {

    override init(_ parentViewController: UIViewController) {
        super.init(parentViewController)
        onInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func onInit() {
        //添加数据
        let section1 = BaseTableViewSection()
        section1.rows.append(ImageDetailTableViewItemHead())
        section1.rows.append(ImageDetailTableViewItemBody())
        section1.rows.append(ImageDetailTableViewItemFoot())
        sections.append(section1)

        //UITableView设置
        self.delegate = self
        self.dataSource = self

        self.showsVerticalScrollIndicator = false
        self.bounces = true
        self.alwaysBounceVertical = true
        self.isScrollEnabled = true
        self.backgroundColor = UIColor.clear
        self.separatorColor = UIColor.clear
        self.tableFooterView = UIView(frame: CGRect.zero)
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        addReuseIdentifier()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetHead = scrollView.contentOffset.y
        (parentViewController as? ImageDetailController)?.refreshHeadImage(offset: offsetHead)

        let offsetFoot = scrollView.contentSize.height - (CGSize.screen().height + scrollView.contentOffset.y)
        (parentViewController as? ImageDetailController)?.refreshFootImage(offset: offsetFoot)
    }

    //MARK:- tableview
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                (parentViewController as? ImageDetailController)?.imageClicked()
                break
            default:
                break
            }
            break
        default:
            break
        }
    }
}

