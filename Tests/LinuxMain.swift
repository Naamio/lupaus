#if os(Linux)

@testable import FutureTests

import XCTest

XCTMain([
	/// Async
	testCase(FutureTests.allTests),

])

#endif