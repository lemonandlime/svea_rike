import Combine
import XCTest

struct TimoutError: Error {}

public extension Publisher {
    func waitFor(expectation: @escaping (Output) -> Bool, timeout: TimeInterval = 3) async {
        var subscriber: AnyCancellable?
        do {
            try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
                subscriber = self
                    .timeout(.seconds(timeout), scheduler: RunLoop.main)
                    .sink(receiveCompletion: { completion in
                              switch completion {
                              case let .failure(error):
                                  continuation.resume(throwing: error)
                              case .finished:
                                  continuation.resume(throwing: XCTestError(.failureWhileWaiting))
                              }

                          },
                          receiveValue: { value in
                              if expectation(value) {
                                  continuation.resume()
                              }
                          })
            }
        } catch {
            XCTFail(error.localizedDescription)
        }

        subscriber?.cancel()
    }
}

public extension XCTestCase {
    func awaitPublisher<T: Publisher>(
        _ publisher: T,
        timeout: TimeInterval = 3,
        file: StaticString = #file,
        line: UInt = #line,
        completeIfValueIs: ((T.Output) -> Bool)? = nil
    ) throws -> T.Output {
        // This time, we use Swift's Result type to keep track
        // of the result of our Combine pipeline:
        var result: Result<T.Output, Error>?
        let expectation = expectation(description: "Awaiting publisher")
        expectation.assertForOverFulfill = false

        let cancellable = publisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    result = .failure(error)
                case .finished:
                    break
                }

                expectation.fulfill()
            },
            receiveValue: { value in

                result = .success(value)
                if completeIfValueIs?(value) == true {
                    expectation.fulfill()
                }
            }
        )

        // Just like before, we await the expectation that we
        // created at the top of our test, and once done, we
        // also cancel our cancellable to avoid getting any
        // unused variable warnings:
        waitForExpectations(timeout: timeout)
        cancellable.cancel()

        // Here we pass the original file and line number that
        // our utility was called at, to tell XCTest to report
        // any encountered errors at that original call site:
        let unwrappedResult = try XCTUnwrap(
            result,
            "Awaited publisher did not produce any output",
            file: file,
            line: line
        )

        return try unwrappedResult.get()
    }
}
