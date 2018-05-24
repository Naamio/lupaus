

/// Aliased `EventLoopFuture` from Swift NIO for Future abstraction.
//public typealias Future = EventLoopFuture

/// Callback method for `Future` result.
public typealias FutureResultCallback<T> = (FutureResult<T>) -> ()

public class Future<Value> {
    private lazy var callbacks = [FutureResultCallback<Value>]()

    var result: FutureResult<Value>? {
        // Observe whenever a result is assigned, and report it
        didSet { result.map(report) }
    }
    
    func observe(with callback: @escaping (FutureResult<Value>) -> Void) {
        callbacks.append(callback)

        // If a result has already been set, call the callback directly
        result.map(callback)
    }

    private func report(result: FutureResult<Value>) {
        for callback in callbacks {
            callback(result)
        }
    }
}