// Playground generated with 🏟 Arena (https://github.com/finestructure/arena)
// ℹ️ If running the playground fails with an error "no such module ..."
//    go to Product -> Build to re-trigger building the SPM package.
// ℹ️ Please restart Xcode if autocomplete is not working.

import Atlantis
import PlaygroundSupport
import Foundation

// Make sure the playground doesn't terminate
PlaygroundPage.current.needsIndefiniteExecution = true

// Accept all challenges from Charles or Proxyman for self-signed certificates
class NetworkSSlProxying: NSObject, URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
    }
}

let httpEndpoint = "https://httpbin.org/get?name=proxyman"

// Init session
let delegate = NetworkSSlProxying()
let session = URLSession(configuration: URLSessionConfiguration.default, delegate: delegate, delegateQueue: nil)

// HTTPS
let task = session.dataTask(with: URLRequest(url: URL(string: httpEndpoint)!)) { (data, response, error) in

    guard let response = response else {
        return
    }

    print(response)
}

// Run on Playground mode
Atlantis.setIsRunningOniOSPlayground(true)
Atlantis.start()

task.resume()
