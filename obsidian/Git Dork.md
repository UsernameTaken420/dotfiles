Git searches to hunt for sensitive information

- `filename:swagger.json`, `extension:.json` look for API specifications
- Search issues for "API key", "exposed key", "authorization: Bearer", "secret" or "token."
- Look at previous pull requests and check code tab (removed keys might not have been deprecated)