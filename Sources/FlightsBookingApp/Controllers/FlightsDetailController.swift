//
//  FlightsDetailController.swift
//  FlightsBookingApp
//
//  Created by Sivaram Yadav on 2/14/22.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

class FlightsDetailController {
    
    func handleFlightDetailsRequest(request: HTTPRequest, response: HTTPResponse) {
        do {
            guard let flightId: Int = Int(request.urlVariables["id"] ?? "") else {
                response
                    .setBody(string: "Id is missing")
                    .completed(status: .badRequest)
                return
            }
            
            let flightDetails = getFlightsDetailData().filter { details in
                if let idVal = details["id"] as? Int {
                    return idVal == flightId
                }
                return false
            }
            
            try response
                .setBody(json: flightDetails)
                .setHeader(.contentType, value: "application/json")
                .completed(status: .ok)
            
        } catch {
            response
                .setBody(string: "Something went wrong")
                .completed(status: .internalServerError)
        }
    }
}


func getFlightsDetailData() -> [[String: Any]] {
    return [
        ["id":1001,
         "flightNumber": "AI323",
         "company": "Air India",
         "fare": 32887,
         "stops": 0,
         "departure":"06:30",
         "arrival": "11:30",
         "duration": "9h 30m",
         "sourceCode":"BOM",
         "destinationCode": "LHR",
         "source":"Mumbai",
         "destination":"London",
         "sourceAirport": "Chhatrapati Shivaji International Airport",
         "destinationAirport": "Heathrow Airport",
         "baggage": "ADULT",
         "checkin": "46 Kgs (2 Pc x 23 Kgs)",
         "cabin": "7 Kgs",
         "fareType": "Flex",
         "cancellation":"Cancellation Available"],
        ["id":1002,
         "flightNumber": "VI116",
         "company": "Vistara",
         "fare": 28613,
         "stops": 1,
         "departure":"20:55",
         "arrival": "08:15",
         "duration": "33h",
         "sourceCode":"BOM",
         "destinationCode": "LHR",
         "source":"Mumbai",
         "destination":"London",
         "sourceAirport": "Chhatrapati Shivaji International Airport",
         "destinationAirport": "Heathrow Airport",
         "baggage": "ADULT",
         "checkin": "46 Kgs (2 Pc x 23 Kgs)",
         "cabin": "7 Kgs",
         "fareType": "Flex",
         "cancellation":"Cancellation Available"],
        ["id":1003,
         "flightNumber": "LF342",
         "company": "Lufthansa",
         "fare": 36282,
         "stops": 0,
         "departure":"02:50",
         "arrival": "14:40",
         "duration": "16h 20m",
         "sourceCode":"BOM",
         "destinationCode": "LHR",
         "source":"Mumbai",
         "destination":"London",
         "sourceAirport": "Chhatrapati Shivaji International Airport",
         "destinationAirport": "Heathrow Airport",
         "baggage": "ADULT",
         "checkin": "46 Kgs (2 Pc x 23 Kgs)",
         "cabin": "7 Kgs",
         "fareType": "Flex",
         "cancellation":"Cancellation Available"],
        ["id":1004,
         "flightNumber": "EH773",
         "company": "Etihad Airways",
         "fare": 141628,
         "stops": 2,
         "departure":"02:50",
         "arrival": "16:25",
         "duration": "18h 05m",
         "sourceCode":"BOM",
         "destinationCode": "LHR",
         "source":"Mumbai",
         "destination":"London",
         "sourceAirport": "Chhatrapati Shivaji International Airport",
         "destinationAirport": "Heathrow Airport",
         "baggage": "ADULT",
         "checkin": "46 Kgs (2 Pc x 23 Kgs)",
         "cabin": "7 Kgs",
         "fareType": "Flex",
         "cancellation":"Cancellation Available"],
        ["id":1005,
         "flightNumber": "BR343",
         "company": "British Airways",
         "fare": 148936,
         "stops": 1,
         "departure":"20:55",
         "arrival": "15:20",
         "duration": "51h",
         "sourceCode":"BOM",
         "destinationCode": "LHR",
         "source":"Mumbai",
         "destination":"London",
         "sourceAirport": "Chhatrapati Shivaji International Airport",
         "destinationAirport": "Heathrow Airport",
         "baggage": "ADULT",
         "checkin": "46 Kgs (2 Pc x 23 Kgs)",
         "cabin": "7 Kgs",
         "fareType": "Flex",
         "cancellation":"Cancellation Available"]]
}
