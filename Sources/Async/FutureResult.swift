
/// Result of `Future` events. Enables the recursive chaining of `Future`
/// callback events. Concept borrowed from Rust Futures.
public indirect enum FutureResult<T> {
    
    /// `Future` event resulted in an error.
    case error(Error)
    /// `Future` event was successful / returned without exception.
    /// Equivelent of `ok` in other `Future` models.
    case success(T)

    /// The resulting error, if an error occured during the event.
    /// Otherwise `nil` if no error is thrown.
    public var error: Error? {
        switch self {
        case .error(let error):
            return error
        default:
            return nil
        }
    }

    /// The expectation of the `Future` event, or `nil` if an error
    /// is thrown.
    public var result: T? {
        switch self {
        case .success(let expectation):
            return expectation
        default:
            return nil
        }
    }

    /// Unwrap contains the exception of the `Future`. If an error exists, it will 
    /// be returned instead.
    public func unwrap() throws -> T {
        switch self {
        case .success(let data):
            return data
        case .error(let error):
            throw error
        }
    }
}