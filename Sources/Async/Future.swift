import NIO

/// Aliased `EventLoopFuture` from Swift NIO for Future abstraction.
public typealias Future = EventLoopFuture

/// Handler method for `Future` result.
public typealias FutureResultHandler<T> = (FutureResult<T>) -> ()
