//
//  ViewController.swift
//  TwitterLoginBankingIE
//
//  Created by Naveen Lingaiah on 17/02/2017.
//  Copyright © 2017 Naveen Lingaiah. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    @IBOutlet weak var twitterLoginButton: UIButton!
    
    private var userSession : TWTRSession? = nil{
        didSet{
            if userSession != nil{
               twitterLoginButton.isEnabled = false
            }else{
                twitterLoginButton.isEnabled = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // If we have a valid user session, go direclty to stream.
        if let _ = userSession{
            self.searchTweets()
        }
    }

    @IBAction func loginTwitter(_ sender: UIButton) {
        Twitter.sharedInstance().logIn(withMethods: [.webBased]) { session, error in
            
            if error != nil{
                print(error?.localizedDescription ?? "Unknown Error !")
                return
            }
            
            if session != nil{
                self.userSession = session
                self.searchTweets()
            }
        }
    }

    
    func searchTweets() {
        // Swift
        // Get the current userID. This value should be managed by the developer but can be retrieved from the TWTRSessionStore.
        let client = TWTRAPIClient(userID: userSession?.userID)
        
        // make requests with client
        let theStream = TWTRSearchTimelineDataSource(searchQuery: "Banking", apiClient: client)
        
        let streamDispalyer = StreamDisplayVC()
        streamDispalyer.theDataSource = theStream
        
        self.present(streamDispalyer, animated: true, completion: {
            print("Now Displaying tweets")
        })
    }

}



