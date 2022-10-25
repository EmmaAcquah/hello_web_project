require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
   # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }



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
        # Send a GET request to /
        # and returns a response object we can test.
        response = get('/names?name=Esme')
        # Assert the response status code and body.
        expect(response.status).to eq 200
        expect(response.body).to eq 'Esme'
      end
    end



end