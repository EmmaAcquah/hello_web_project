POST /sort-names Route Design Recipe

1. Design the Route Signature

What does it do?
Returns names sorted in ascending order

HTTP method: POST
path: /sort-names
query parameters (passed in the URL):
  None - POST request
body parameters (passed in the request body):
  names = Joe,Alice,Zoe,Julia,Kieran (string)

2. Design the Response

When body param 'names' is 'Joe,Alice,Zoe,Julia,Kieran'
```html
<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->
'Alice,Joe,Julia,Kieran,Zoe'

3. Write Examples

```
# Request:
POST http://localhost:9292/sort-names

# With body parameters:
names=Joe,Alice,Zoe,Julia,Kieran

# Expected response (2OO OK):
Alice,Joe,Julia,Kieran,Zoe

```

```
# Request:
POST http://localhost:9292/sort-names

# With body parameters:
names=Sarah,Robert,Anna

# Expected response (2OO OK):
Anna,Robert,Sarah

```

4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /sort-names" do
    
    it 'returns 200 OK and sorts given names in ascending order' do
      response = post('/sort-names', names: 'Sarah,Robert,Anna')

      expect(response.status).to eq 200
      expect(response.body).to eq 'Anna,Robert,Sarah'
    end
    
    it 'returns 200 OK and sorts given names in ascending order' do
      response = post('/sort-names', names: 'Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq 200
      expect(response.body).to eq 'Alice,Joe,Julia,Kieran,Zoe'
    end
  end
end
```

5. Implement the Route

Write the route and web server code to implement the route behaviour.
