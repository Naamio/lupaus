/// Aliased `EventLoopFuture` from Swift NIO for Promise abstraction.
//public typealias Promise = EventLoopPromise

public class Promise<Value>: Future<Value> {
    init(value: Value? = nil) {
        super.init()

        // If the value was already known at the time the promise
        // was constructed, we can report the value directly
        result = value.map(FutureResult.success)
    }

    func resolve(with value: Value) {
        result = .success(value)
    }

    func reject(with error: Error) {
        result = .error(error)
    }
}
