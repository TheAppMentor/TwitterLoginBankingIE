//
//  StreamDisplayVC
//  TwitterLoginBankingIE
//
//  Created by Naveen Lingaiah on 17/02/2017.
//  Copyright © 2017 Naveen Lingaiah. All rights reserved.
//

import UIKit
import TwitterKit

class StreamDisplayVC: TWTRTimelineViewController {

    var theDataSource : TWTRSearchTimelineDataSource? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let theDataSource = theDataSource{
            self.dataSource = theDataSource
        }
    }
}
