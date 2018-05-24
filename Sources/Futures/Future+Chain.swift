extension Future {
    func chained<NextValue>(with closure: @escaping (Value) throws -> Future<NextValue>) -> Future<NextValue> {
        // Start by constructing a "wrapper" promise that will be
        // returned from this method
        let promise = Promise<NextValue>()

        // Observe the current future
        observe { result in
            switch result {
            case .success(let value):
                do {
                    // Attempt to construct a new future given
                    // the value from the first one
                    let future = try closure(value)

                    // Observe the "nested" future, and once it
                    // completes, resolve/reject the "wrapper" future
                    future.observe { result in
                        switch result {
                        case .success(let value):
                            promise.resolve(with: value)
                        case .error(let error):
                            promise.reject(with: error)
                        }
                    }
                } catch {
                    promise.reject(with: error)
                }
            case .error(let error):
                promise.reject(with: error)
            }
        }

        return promise
    }
}