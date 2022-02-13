//
//  Router.swift
//  FlightsBookingApp
//
//  Created by Sivaram Yadav on 2/14/22.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

func setupRouter() -> Routes {
    
    var routes = Routes()
    
    routes.add(method: .get, uri: "/") { request, response in
        response
            .setBody(string: getIndexData())
            .completed()
    }
    
    routes.add(method: .get, uri: "/flights") { request, response in
        FlightsListController().handleFlightsListRequest(request: request, response: response)
    }
    
    routes.add(method: .get, uri: "/details/{id}") { request, response in
        FlightsDetailController().handleFlightDetailsRequest(request: request, response: response)
    }
    
    return routes
}


func getIndexData() -> String {
    
    return """
<h1 style="color: #5e9ca0;">Server Side Programming in Swift</h1>
<h2 style="color: #2e6c80;">Swift can do a lot more than we think</h2>
<p>All the APIs that are being used by Whoosh app are written in Swift using the framework Perfect. Perfect has done all the heavy lifting, and all we need to do is use it's APIs.&nbsp;</p>
<p>In regards of NodeJS, Perfect is Express for us. In fact, a lot more. Here's what Perfect can do</p>
<h2 style="color: #2e6c80;">Some features of Perfect:</h2>
<ol style="list-style: none; font-size: 14px; line-height: 32px; font-weight: bold;">
<li style="clear: both;">Creating HTTP Server</li>
<li style="clear: both;">Routing</li>
<li style="clear: both;">DB Connections (Mongo, MySQL, Maria, Postgres etc)</li>
<li style="clear: both;">Web Sockets</li>
<li style="clear: both;">File Handling</li>
<li style="clear: both;">Server extensions for messaging queues (Kafka, Mosquitto, Zookeeper etc)</li>
<li style="clear: both;">Deployment (directly on EC2)</li>
<li style="clear: both;">... and a lot more</li>
</ol>
<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
<h2 style="color: #2e6c80;">Let's give it a try:</h2>
<p><strong>In this week's video, I'll explain what is Perfect, how to start with it, how to handle the HTTP Request, structuring of the project etc. Stay tuned.</strong></p>
<p>&nbsp;</p>
<h2 style="color: #2e6c80; text-align: right;"><span style="color: #000000;">iCode</span></h2>
"""
}
