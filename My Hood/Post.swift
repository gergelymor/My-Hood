//
//  Post.swift
//  My Hood
//
//  Created by Gergely Mor Bacskai on 19/06/16.
//  Copyright © 2016 bacskai. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding{
    
    private var _imgPath: String!
    private var _title: String!
    private var _postDesc: String!
    
    var imgPath: String {
        get{
            return _imgPath
        }
    }
    
    var title: String {
        get {
            return _title
        }
    }
    
    var postDesc: String {
        get{
            return _postDesc
        }
    }
    
    init(imgPath: String, title: String, description: String){
        self._imgPath = imgPath
        self._title = title
        self._postDesc = description
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        self.init()
        self._imgPath = aDecoder.decodeObjectForKey("imgPath") as? String
        self._postDesc = aDecoder.decodeObjectForKey("postDesc") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._imgPath, forKey: "imgPath")
        aCoder.encodeObject(self._title, forKey: "title")
        aCoder.encodeObject(self._postDesc, forKey: "postDesc")
    }
    
}