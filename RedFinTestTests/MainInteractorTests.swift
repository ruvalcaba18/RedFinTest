//
//  RedFinTestTests.swift
//  RedFinTestTests
//
//  Created by Jael on 02/02/2024.
//

import XCTest
@testable import RedFinTest

final class MainInteractorTests: XCTestCase {
    
    var interactor: MainViewInteractor!
    private var urlToTest: String!
    private var urlToTestAndFail: String!
    
    override func setUp() {
        super.setUp()
        interactor = MainViewInteractor()
        urlToTest = "https://data.sfgov.org/resource/bbb8-hzi6.json"
        urlToTestAndFail = "https://data.sfgov.org/resource/bbb8-hzi.json"
    }
    
    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    func test_retrieveNearFoodTruckData_TestSuccesfull() {
        interactor.retrieveNearFoodTruckTest(withUrl: urlToTest) { data in
            XCTAssertNotNil(data)
        }
    }
    
    func test_retrieveNearFoodTruckData_TestFail() {
        interactor.retrieveNearFoodTruckTest(withUrl: urlToTestAndFail) { data in
            XCTAssertNil(data)
        }
    }
    
    func test_RetreieveNearFoodTrucks_withCompletion_Successfull() {
        
        interactor.testRetreieveNearFoodTrucks(withURL: urlToTest) { result in
            switch result{
            case .success( let model):
                XCTAssertNotNil(model)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }
    
    func test_RetreieveNearFoodTrucks_withCompletion_Fail() {
        
        interactor.testRetreieveNearFoodTrucks(withURL: urlToTestAndFail) { result in
            switch result{
            case .success( let model):
                XCTAssertNil(model)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }

}
