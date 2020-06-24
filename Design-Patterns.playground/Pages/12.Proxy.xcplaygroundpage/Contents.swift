import Foundation

protocol Subject {
    func request()
}

class RealSubject: Subject {
    func request() {
        print("RealSubject: Handling request.")
    }
}

class Proxy: Subject {
    private var realSubject: RealSubject
    
    init(_ realSubject: RealSubject) {
        self.realSubject = realSubject
    }
    
    private func checkAccess() -> Bool {
        print("Proxy: Checking access prior to firing a real request.")
        return true
    }
    
    private func logAccess() {
        print("Proxy: Logging the time of request.")
    }
    
    func request() {
        if (checkAccess()) {
            realSubject.request()
            logAccess()
        }
    }
}

let realSubject = RealSubject()
realSubject.request()

let proxy = Proxy(realSubject)
proxy.request()
