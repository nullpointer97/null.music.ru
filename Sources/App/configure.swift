import Vapor

// configures your application
public func configure(_ app: Application) throws {

    app.http.server.configuration.hostname = "0.0.0.0"
    app.http.server.configuration.port = 80
    
    try routes(app)
}
