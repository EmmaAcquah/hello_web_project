GET /names Route Design Recipe

1. Design the Route Signature

What does it do?
Returns names 

HTTP method: GET
path: /names
query parameters (passed in the URL):
  name (string)
body parameters (passed in the request body):
  None - GET request

2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

When query param 'name' is 'Emma'
```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->
'Emma'

3. Write Examples

```
# Request:
GET /names?name=Julia, Mary, Karim

# Expected response (2OO OK):
Julia, Mary, Karim

```

```
# Request:
GET /names?name=Esme

# Expected response (2OO OK):
Esme

```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it 'returns 200 OK and one name' do
      # Assuming the post with id 1 exists.
      response = get('/posts?id=1')

      expect(response.status).to eq(200)
      # expect(response.body).to eq(expected_response)
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

