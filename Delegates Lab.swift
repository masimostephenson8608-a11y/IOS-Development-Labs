//
//  Delegates Lab.swift
//  DelegatesLab
//
//  Created by Masimo Stephenson on 10/30/25.
//

import Foundation

/* Delegates is like seperating some duties from the actual object/instance, and giving it to another instance made entirely for doing the work, set up using protocols.
 1. First you create a Protocol thats set up with functions to deal with the work.
 */
protocol somethingDelegate {
    func doWork()
}
/*
 2. After making the protocol, you need the main class, it should hold the data and maybe a little bit of function or none, depending on what you need. This class should have 'var delegate: somethingDelegate?' to make sure that you can pass in the delegated class, and make it optional in case the delegated class isn't passed in.
 */
class somethingDelegator {
    //data
    var delegate: somethingDelegate?
    
    //methods
}
/*
 3. After having that class set up, you can move on to creating the class that is being delegated to. To set it up, you just need to make it follow the protocol you made earlier.
 */
class somethingDelegated: somethingDelegate {
    func doWork() {
        return
    }
    //In here you simply have to do the work using methods and whatnot. If you have to pass in information from the delegator, which you will, you put paramaters from the delegator when you're initializing the delegator.
}
