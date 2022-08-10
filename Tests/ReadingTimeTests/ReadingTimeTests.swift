import XCTest
import ReadingTime

final class ReadingTimeTests: XCTestCase {
    func test_GivenDefaultWPMIsUsed_WhenContentsOfAFileAreProvided_ThenReadingTimeIsReturned() {
        let contents = "Hello World! This is my article!"
        let calculatedTime = ReadingTime.calculate(for: contents)
        
        XCTAssertEqual(calculatedTime, 1358.49)
    }
    
    func test_GivenCustomWPMIsUsed_WhenContentsOfAFileAreProvided_ThenReadingTimeIsReturned() {
        let contents = "Hello World! This is my article!"
        let calculatedTime = ReadingTime.calculate(for: contents, wpm: 1)
        
        XCTAssertEqual(calculatedTime, 360000.0)
    }
    
    func test_GivenDefaultWPMIsUsed_WhenFileURLIsProvided_ThenReadingTimeIsReturned() throws {
        let testFileURL = FileManager.default.temporaryDirectory.appendingPathComponent("test.md")
        try "Hello World! This is my article!".data(using: .utf8)!.write(to: testFileURL)
        
        let readingTime = ReadingTime.calculate(for: testFileURL)
        
        // Clean up
        try FileManager.default.removeItem(at: testFileURL)
    }
}
