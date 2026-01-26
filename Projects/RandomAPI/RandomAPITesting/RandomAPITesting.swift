//
//  RandomAPITesting.swift
//  RandomAPITesting
//
//  Created by Masimo Stephenson on 1/26/26.
//

import XCTest
import RandomAPI
@testable import RandomAPI

final class RandomAPITesting: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNetworkThrow() async throws {
        var network = StubRepApiController()
        
        do {
            try await network.fetchRepresentatives(zip: "11111")
            XCTFail()
        } catch {
          
        }
    }
    
    func testNetwork() async {
        var network = StubRepApiController()
        let comparison = Representative(name: "Test1", party: "Rep", state: "Utah", district: "Yes", phone: "3333", office: "No", link: "Yes")
        do {
            let results = try await network.fetchRepresentatives(zip: "80111")
            guard let result = results.first else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(result, comparison)

        } catch {
            XCTFail()
        }
    }
}
