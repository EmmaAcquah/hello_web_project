require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
   # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /hello" do
    it "returns 'Hello Leo" do
      #skipping this test because the corresponding method was updated to return HTML instead
        response = get('/hello?name=Leo')
        
        expect(response.status).to eq 200
        expect(response.body).to include 'Hello Leo' #Changed test from eq to include (for HTML)
    end

    it "return 'Hello Emma" do
      #skipping this test because the corresponding method was updated to return HTML instead
        response = get('/hello?name=Emma')
        
        expect(response.status).to eq 200
        expect(response.body).to include 'Hello Emma'    
    end

    it 'contains a h1 title' do
        response = get('/hello')
    
        expect(response.body).to include('<h1>Hello')
        #changed expected response to check for '<h1>Hello' instead of '<h1>Hello!</h1>' because index.erb file was updated to include @name
    end
end


  context "GET /names" do
    it "returns 200 OK with a string of 3 names" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get('/names?name=Julia, Mary, Karim')
      # Assert the response status code and body.
      expect(response.status).to eq 200
      expect(response.body).to eq 'Julia, Mary, Karim'
    end

    it "returns 200 OK with 1 name" do
      response = get('/names?name=Esme')
      expect(response.status).to eq 200
      expect(response.body).to eq 'Esme'
    end
  end

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