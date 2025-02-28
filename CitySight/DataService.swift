import Foundation

struct DataService {
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    // Retrieves the API key from the application's main bundle's infoDictionary using the key "API_KEY".
    // This value is cast as an optional String because the key might not exist, resulting in nil.

    func businessSearch() async {
        // Check if api key exists
        guard apiKey != nil else {
            return
        }
        // Uses a guard statement to ensure that apiKey is not nil.
        // If apiKey is nil, the function returns early, preventing further execution.

        // 1. Create url
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=35.665517&longitude=139.770398&categories=restaurants&limit=10") {
        // The if-let statement safely unwraps the optional URL; if the string is a valid URL, the code inside the block is executed.

            // 2. Create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            // Adds an "Authorization" header to the request.
            // It uses the "Bearer" token format, inserting the apiKey (force-unwrapped with !) since the guard above ensures it's not nil.
            
            request.addValue("application/json", forHTTPHeaderField: "accept")
            // Adds an "accept" header to the request, indicating that the client expects a response in JSON format.

            // 3. Send request
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                // Sends the network request asynchronously using URLSession.
                // On success, it returns a tuple containing the response data and response metadata.
                print(data)
                print(response)
            }
            catch {
                print(error)
            }
        }
    }
}
