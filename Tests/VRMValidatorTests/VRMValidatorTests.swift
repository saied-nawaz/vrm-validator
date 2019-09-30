import XCTest
@testable import VRMValidator

final class VRMValidatorTests: XCTestCase {

    static var validAddresses: [String] = [
        //== Valid Current Style ==
        "AB51ABC",
        //== Valid Prefix ==
        "A123ABC",
        "A12ABC",
        "A1ABC",
        //== Valid Suffix ==
        "ABC123A",
        "ABC12A",
        "ABC1A",
        //== Valid Dateless ==
        "1ABC",
        "ABC1",
        "1234A",
        "A1234",
        "1234AB",
        "AB1234",
        "123ABC",
        "ABC123",
        //== Valid Northern Ireland ==
        "ABC123",
        "ABC1234",
        //== Valid Diplomatic ==
        "101D234",
        "123X456",
        //== Valid With Spaces ==
        "AB51 ABC",
        "A123 ABC"
    ]

    static var invalidAddresses: [String] = [
        //-- Invalid Current Style --
        //- Missing First Letter = Prefix e.g. A51ABC
        //- Extra First Letter -
        "ABC54ABC",
        //- Missing Number -
        "AB5ABC",
        //- Extra Number -
        "AB543ABC",
        //- Missing Last Letter -
        "AB54AB",
        //- Extra Last Letter -
        "AB54ABCD",
        //-- Invalid Prefix --
        //- Missing First Letter = Dateless e.g. 123ABC
        //- Extra First Letter -
        "AB1ABC",
        //- Missing Numbers -
        "AABC",
        //- Extra Numbers -
        "A1234ABC",
        //- Missing Last Letter -
        "A1AB",
        //- Extra Last Letter -
        "A1ABCD",
        //-- Invalid Suffix --
        //- Missing First Letter -
        "AB1A",
        "AB123A",
        //- Extra First Letter
        "ABCD1A",
        "ABCD123A",
        //- Missing Numbers -
        "ABCA",
        //- Extra Numbers -
        "ABC1234A",
        //- Missing Last Letter = Dateless e.g. ABC123
        //- Extra Last Letter -
        "ABC1AB",
        //-- Invalid Dateless --
        //- Missing Numbers -
        "ABC",
        //- Extra Numbers -
        "12345A",
        "A12345",
        //- Missing Letters -
        "1",
        "123",
        "1234",
        //- Extra Letters
        "1ABCD",
        "ABCD1",
        //- More than 6 characters -
        "1234ABC",
        "ABCD123",
        //-- Invalid Northern Ireland --
        //- Extra Letter -
        "ABCD123",
        //- Extra Number -
        "ABC12345",
        //-- Invalid Diplomatic --
        //- Not D or X in middle -
        "123A456",
        //- Extra numbers -
        "1234D567",
        "123X4567"
    ]

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidAddresses() {
        VRMValidatorTests.validAddresses.forEach({
            XCTAssertTrue(VRMValidator.validate(vrm: $0), "AssertTrue Failure: \($0)")
        })
    }

    func testInvalidAddresses() {
        VRMValidatorTests.invalidAddresses.forEach({
            XCTAssertFalse(VRMValidator.validate(vrm: $0), "AssertFalse Failure: \($0)")
        })
    }

    static var allTests = [
        ("Valid Tests", testValidAddresses),
        ("Invalid Tests", testInvalidAddresses)
    ]
}
