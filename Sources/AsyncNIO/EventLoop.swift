import NIO

/// We extend the Swift NIO EventLoop as the underlying method of asynchronous
/// events. 
extension EventLoop {
    /// Factory function for generating a new new promise for the specified type.
    public func newPromise<T>(_ type: T.Type, file: StaticString = #file, line: UInt = #line) -> EventLoopPromise<T> {
        return newPromise(file: file, line: line)
    }
}