import Foundation


/// Простая обертка над URLSession
public final class BaseNetworkService: Network {
    private var baseURL: String?
    
    public init() {}
    
    public func execute(
        path: String,
        method: RequestMethod = .get,
        params: [String: Any]? = nil
    ) async throws -> Data {
        guard let baseURL else { fatalError("Вызовите метод configure для класса \(self)") }
        
        let stringURL = baseURL + "/" + path
        
        guard let url = URL(string: stringURL) else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method.value
        
        if let params {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        }
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return data
    }
    
    public func configure(with baseURL: String) {
        self.baseURL = baseURL
    }
}
