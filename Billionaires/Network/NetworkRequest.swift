//
//  NetworkRequest.swift
//  Billionaires
//
//  Created by Umair Hanif on 22/08/2022.
//

import Foundation
import Alamofire

final class NetworkService {
    
    
    static let shared = NetworkService()
    
    
    private init(){}
    
    func getBillionairesData( completion: @escaping (_ success: Bool, _ data: [HomeViewModel]?) -> Void) {

        let url = "https://forbes400.herokuapp.com/api/forbes400/getAllBillionaires?limit=100"
        
        print("url for getData = \(url)")
        
        AF.request(url, method: .get,  parameters: nil, encoding: JSONEncoding.default) { request in
            request.timeoutInterval = 20
        }.response { response in
            
            Helper.loader?.stopAnimating()
            
            switch response.result {
                
            case .success(_):
                
                do {
                    
                    let decodedData : [BillionairesDataModel] = try JSONDecoder().decode([BillionairesDataModel].self, from: response.data!)
                    
                    var finalData = [HomeViewModel]()
                    
                    for data in decodedData {
                        finalData.append(HomeViewModel(data: data))
                    }
                    
                    completion(true, finalData)
                    
                } catch {
                    print("Error in decoding data response = \(error)")
                }
                
            case .failure(_):
                
                completion(false, nil)
                
            }
            
        }
        
    }
    
    
}

