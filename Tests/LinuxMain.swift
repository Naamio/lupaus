#if os(Linux)

@testable import LupausTests

import XCTest

XCTMain([
	/// Async
	testCase(FutureTests.allTests),

])

#endif