require './app.rb'
require 'rack/test'

set :environment, :development

def app
  Sinatra::Application
end
  
describe "Queue Service" do
  include Rack::Test::Methods

  before :all do
    post "/"
    @queue_id = JSON.parse(last_response.body)["queue_id"]

  end

  it "should load the home page" do
    get '/'
    last_response.should be_ok
  end

  it "should create a queue" do
    post '/'
    expect(last_response.body).to include('queue')
  end

  it "should add something to the queue and be able to get it back" do
    puts "should be x-www-form-urlencoded"
    post "/#{@queue_id}", {body: "this is something!"}, "content_type" => "application/x-www-form-urlencoded"
    puts "shouldn't be x-www.form-urlencoded"
    post "/#{@queue_id}", {}, "ContentType" => nil
    puts "done"
  end


end
