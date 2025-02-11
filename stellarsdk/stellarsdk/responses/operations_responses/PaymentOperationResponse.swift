//
//  PaymentOperationResponse.swift
//  stellarsdk
//
//  Created by Rogobete Christian on 07.02.18.
//  Copyright © 2018 Soneso. All rights reserved.
//

import Foundation

///  Represents a payment operation response.
///  See [Horizon API](https://www.stellar.org/developers/horizon/reference/resources/operation.html#payment "Payment Operation")
public class PaymentOperationResponse: OperationResponse {
    
    /// Amount sent.
    public var amount:String
    
    /// Asset type (native / alphanum4 / alphanum12)
    public var assetType:String
    
    /// Code of the destination asset.
    public var assetCode:String?
    
    /// Asset issuer.
    public var assetIssuer:String?
    
    /// Sender of a payment.
    public var from:String
    public var fromMuxed:String?
    public var fromMuxedId:Int?
    
    /// Destination of a payment.
    public var to:String
    public var toMuxed:String?
    public var toMuxedId:Int?
    
    // Properties to encode and decode
    private enum CodingKeys: String, CodingKey {
        case amount
        case assetType = "asset_type"
        case assetCode = "asset_code"
        case assetIssuer = "asset_issuer"
        case from
        case fromMuxed = "from_muxed"
        case fromMuxedId = "from_muxed_id"
        case to
        case toMuxed = "to_muxed"
        case toMuxedId = "to_muxed_id"
    }
    
    /**
        Initializer - creates a new instance by decoding from the given decoder.
     
        - Parameter decoder: The decoder containing the data
     */
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        amount = try values.decode(String.self, forKey: .amount)
        assetType = try values.decode(String.self, forKey: .assetType)
        assetCode = try values.decodeIfPresent(String.self, forKey: .assetCode)
        assetIssuer = try values.decodeIfPresent(String.self, forKey: .assetIssuer)
        from = try values.decode(String.self, forKey: .from)
        fromMuxed = try values.decodeIfPresent(String.self, forKey: .fromMuxed)
        fromMuxedId = try values.decodeIfPresent(Int.self, forKey: .fromMuxedId)
        to = try values.decode(String.self, forKey: .to)
        toMuxed = try values.decodeIfPresent(String.self, forKey: .toMuxed)
        toMuxedId = try values.decodeIfPresent(Int.self, forKey: .toMuxedId)
        
        try super.init(from: decoder)
    }
}

