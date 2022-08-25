//
//  Helper.swift
//  Billionaires
//
//  Created by Umair Hanif on 24/08/2022.
//

import Foundation
import SystemConfiguration
import NVActivityIndicatorView


public class Helper {
    
    static var loader : NVActivityIndicatorView?
    
    static func addActivityIndicator(_ view: UIView) {
        
        loader = NVActivityIndicatorView(frame: .zero, type: .orbit, color: .green, padding: 50.0)
        loader?.translatesAutoresizingMaskIntoConstraints = false
        if let loader = loader {
            view.addSubview(loader)
        }
        loader?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        loader?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loader?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loader?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    
    
}


//MARK: - Network availability
public class Reachability {

    class func isConnectedToNetwork() -> Bool {

        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }

        /* Only Working for WIFI
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired

        return isReachable && !needsConnection
        */

        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)

        return ret

    }
}
