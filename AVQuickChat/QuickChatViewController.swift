//
//  QuickChatViewController.swift
//  AVQuickChat
//
//  Created by Ashish Verma on 31/08/18.
//  Copyright © 2018 caffieneToCode. All rights reserved.
//

import UIKit

class QuickChatViewController: UITableViewController {
    
    let cellIdentifier = "QuickChatCell"
    let chatMessages = [
        [
            QuickChatMessage(text: "Hello. Yes, I got your paper. I thought it was pretty good. What are your concerns about it?", date: Date.dateFromString(string: "02/08/2018"), isIncoming: true),
            QuickChatMessage(text: "I guess I just wanted someone else to look at it. My TA said it was good, but it could some help.", date: Date.dateFromString(string: "02/08/2018"), isIncoming: false),
            QuickChatMessage(text: "What type of help? Anything in particular?", date: Date.dateFromString(string: "02/08/2018"), isIncoming: true),
            QuickChatMessage(text: "I think I need a stronger thesis. And better organization.", date: Date.dateFromString(string: "02/08/2018"), isIncoming: false)
        ],
        [
            QuickChatMessage(text: "Okay, great. I think those two things go together. If you have strong thesis, it suggests the organization. Where is your thesis?", date: Date.dateFromString(string: "03/08/2018"), isIncoming: true),
            QuickChatMessage(text: "I think it is the last sentence in the first paragraph.", date: Date.dateFromString(string: "03/08/2018"), isIncoming: false),
            QuickChatMessage(text: "?", date: Date.dateFromString(string: "03/08/2018"), isIncoming: false)
        ],
        
        [
            QuickChatMessage(text: "Okay, do you think that sentence reflects the rest of your paper?", date: Date.dateFromString(string: "06/08/2018"), isIncoming: true),
            QuickChatMessage(text: "Should it?", date: Date.dateFromString(string: "06/08/2018"), isIncoming: false),
            QuickChatMessage(text: "Yeah, I think that would be nice. Some people think of a thesis as a road map to the rest of the paper.", date: Date.dateFromString(string: "06/08/2018"), isIncoming: true),
            QuickChatMessage(text: "oooohhh.....so maybe I should mention women's oppression in a work setting.", date: Date.dateFromString(string: "06/08/2018"), isIncoming: false),
            ],
        [
            QuickChatMessage(text: "Yes, that seems to be a major component of your paper, so introducing it into your thesis or at least alluding to it may be a good idea.", date: Date.dateFromString(string: "07/08/2018"), isIncoming: true),
            QuickChatMessage(text: "How do I do that?", date: Date.dateFromString(string: "07/08/2018"), isIncoming: false),
            QuickChatMessage(text: "Well, your thesis has the traditional thesis look (compound sentence with a semicolon), so just add two more elements to the last part, \"this is because 1, 2, and 3\" Or you could heighten the cause and effect relationship.", date: Date.dateFromString(string: "07/08/2018"), isIncoming: true),
            QuickChatMessage(text: "I like the first suggestion. That's easier. :)", date: Date.dateFromString(string: "07/08/2018"), isIncoming: false),
            QuickChatMessage(text: "Good. So, are these suggestions helpful?", date: Date.dateFromString(string: "07/08/2018"), isIncoming: true),
            QuickChatMessage(text: "Yeah, I think so. What else?", date: Date.dateFromString(string: "07/08/2018"), isIncoming: false),
            ],
        [
            QuickChatMessage(text: "What other concerns do you have?", date: Date.dateFromString(string: "08/08/2018"), isIncoming: true),
            QuickChatMessage(text: "Is my organization okay?", date: Date.dateFromString(string: "08/08/2018"), isIncoming: false),
            QuickChatMessage(text: "Well since you like the 1, 2 and 3 structure for your thesis, just follow the same pattern in the body of your paper. 1 is the first paragraph of the body, 2 is the second and so on...", date: Date.dateFromString(string: "08/08/2018"), isIncoming: true),
            QuickChatMessage(text: "I think I do that, don't I?", date: Date.dateFromString(string: "08/08/2018"), isIncoming: false)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Quick Chat"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(QuickChatCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let firstMessageinSection = chatMessages[section].first {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormater.string(from: firstMessageinSection.date)
            return dateString
        }
        return "\(Date())"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quickChatCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? QuickChatCell
        let quickChatMessage = chatMessages[indexPath.section][indexPath.row]
        quickChatCell?.quickChatMessage = quickChatMessage
        return quickChatCell! 
    }
}

