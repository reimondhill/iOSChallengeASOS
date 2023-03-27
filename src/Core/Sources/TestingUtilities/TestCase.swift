//
// Copyright © 2022 ReimondHill. All rights reserved.
//

import XCTest

public typealias TestCaseParams<Input, Output> = (
	input: Input,
	expectedOutput: Output,
	source: TestCase<Input, Output>.SourceLocation
)

/// Contains the logic for a reusable object to perform parameterized tests.
///
/// The entry point and the outcome are declared by the respective Input and Output generic type which also infer optional capabilities.
public struct TestCase<Input, Output> {

	/// location in source code
	public struct SourceLocation {
		public let file: StaticString
		public let line: UInt
	}

	// MARK: - Properties

	/// Entry point of the test.
	public let input: Input

	/// Final value or outcome of the test.
	public let output: Output

	/// Message with extra information to pass to the assertions.
	public let message: String?

	// Location where the instance was created
	fileprivate let sourceLocation: SourceLocation

	// MARK: - Constructor

	/// Initializes the object with given parameters.
	/// - Parameters:
	///   - input: Entry point of the test.
	///   - output: Final value or outcome of the test.
	///   - message: Message with extra information to pass to the assertions.
	///   - file: The file that declares the object.
	///   - line: The line from the file where the object is declared.
	public init(
		input: Input,
		output: Output,
		message: String? = nil,
		file: StaticString = #filePath,
		line: UInt = #line
	) {
		self.input = input
		self.output = output
		self.message = message
		self.sourceLocation = SourceLocation(
			file: file,
			line: line
		)
	}

	/// Initializes the object with matching inputs and outputs. Useful for testing a type is propagated to another object
	/// - Parameters:
	///   - inputAndOutput: The expected inout and output of the test
	///   - message: Message with extra information to pass to the assertions.
	///   - file: The file that declares the object.
	///   - line: The line from the file where the object is declared.
	public init(
		inputAndOutput: Input,
		message: String? = nil,
		file: StaticString = #filePath,
		line: UInt = #line
	) where Input == Output {
		self.init(
			input: inputAndOutput,
			output: inputAndOutput,
			message: message,
			file: file,
			line: line
		)
	}

	// MARK: - Helpers

	/// Wraps the functionality of XCTAssertEqual around Input on Output.
	/// - Parameter transformation: Completion block that provides the a possible outcome to be used to assert the declared outcome.
	public func assertEqual(transformation: (Input) throws -> Output) rethrows where Output: Equatable {
		let value = try transformation(input)
		XCTAssertEqual(
			value,
			output,
			message ?? "",
			file: sourceLocation.file,
			line: sourceLocation.line
		)
	}

	fileprivate func run(test: (Input, Output) async throws -> Void) async rethrows {
		try await test(input, output)
	}

	fileprivate func run(test: (Input, Output) throws -> Void) rethrows {
		try test(input, output)
	}
}

extension Array {
	/// Perfoms assertEqual iteratively for a collection of test cases
	/// - Parameter transformation: Completion block to provide the expected output for each test case
	public func assertEqualTestCases<Input, Output>(
		transformation: (Input) throws -> Output
	) rethrows where Element == TestCase<Input, Output>, Output: Equatable {
		try forEach({ try $0.assertEqual(transformation: transformation) })
	}

	///  Run tests. Caller provides assertions in the test block
	/// - Parameter test: The tests to run. Paramaters include input, expected output and SourceLocation
	public func run<Input, Output>(
		test: (TestCaseParams<Input, Output>) async throws -> Void
	) async rethrows where Element == TestCase<Input, Output> {
		for testCase in self {
			try await testCase.run { input, output in
				try await test((input, output, testCase.sourceLocation))
			}
		}
	}

	///  Run tests. Caller provides assertions in the test block
	/// - Parameter test: The tests to run. Paramaters include input, expected output and SourceLocation
	public func run<Input, Output>(
		test: (TestCaseParams<Input, Output>) throws -> Void
	) rethrows where Element == TestCase<Input, Output> {
		for testCase in self {
			try testCase.run { input, output in
				try test((input, output, testCase.sourceLocation))
			}
		}
	}
}

extension TestCase where Input == Output, Output: Equatable {
	/// Asserts that Input and Output are equal.
	public func assertAreEqual() {
		XCTAssertEqual(
			input,
			output,
			message ?? "",
			file: sourceLocation.file,
			line: sourceLocation.line
		)
	}

	/// Asserts that Input and Output are not equal.
	public func assertAreNotEqual() {
		XCTAssertNotEqual(
			input,
			output,
			message ?? "",
			file: sourceLocation.file,
			line: sourceLocation.line
		)
	}
}
