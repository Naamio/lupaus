import Dispatch
import NIO

/// Aliased `EventLoopFuture` from Swift NIO for Promise abstraction.
public typealias Promise = EventLoopPromise

extension EventLoop {
    /// Creates a new promise for the specified type.
    public func newPromise<T>(_ type: T.Type, file: StaticString = #file, line: UInt = #line) -> Promise<T> {
        return newPromise(file: file, line: line)
    }
}