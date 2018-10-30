//
//  Box.swift
//  Storage box content
//
//  Created by Simon Sawert on 2018-10-27.
//  Copyright © 2018 Simon Sawert. All rights reserved.
//
import Foundation

struct Position {
    var Label : String
    var Boxes : [Box]
}

struct Box {
    var Label : String
    var LastOpened : NSDate?
    var Items : [BoxItem]
}

struct BoxItem {
    var Label : String
}
