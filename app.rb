require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # Declares a route that responds to a request with:
  #  - a GET method
  #  - the path /
  get '/' do
    # The code here called a "route block" and is executed when a request is received,
    # and need to send a response. 

    # We can simply return a string which
    # will be used as the response content.
    # Unless specified, the response status code
    # will be 200 (OK).
    return 'Hello!'
  end

  get '/hello' do
    @name = params[:name] #sets an instance variable in the HTTP route block
    #return "Hello #{name}"
    return erb(:index)
    # The process is then the following:
    # 1. Ruby reads the .erb view file
    # 2. It looks for any ERB tags and replaces it by their final value
    # 3. The final generated HTML is sent in the response
  end

  get '/posts' do
    return "A list of posts"
  end

  get '/names' do
    names = params[:name]
    return names
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]
    return "Thanks #{name}, you sent this message: '#{message}'"
  end

  post '/sort-names' do
    names = params[:names]
    separated_names = names.split(",")
    return separated_names.sort.join(",")
  end

end