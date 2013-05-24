require 'rubygems'
require 'sinatra'
require 'erb'
require 'redis'
require 'json'

configure do
  redisUri = ENV["REDISTOGO_URL"] || 'redis://localhost:6379'
  uri = URI.parse(redisUri) 
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password) 
end


# show the index page
get '/' do
  erb :index
end


# create a new queue
post '/' do
  content_type :json
  begin 
    uuid = SecureRandom.uuid 
  end until REDIS.sadd("queues", uuid)

  {queue_id: uuid }.to_json
end

# peek into the next item in the queue
# this should be a little less open
get '/:queue' do

  REDIS.lindex(params[:queue], 0)

end

# add a new item to the queue
# or don't if its not of the right content type
post '/:queue' do
  if not REDIS.sismember("queues",params[:queue])
    status 404
    return
  end

  if request.content_type == 'application/x-www-form-urlencoded'
    REDIS.rpush(params[:queue], params[:post][:body])
  else
    REDIS.lpop(params[:queue])
  end

end

# delete a queue
delete '/:queue' do
  REDIS.del(params[:queue])
  REDIS.srem("queues",params[:queue])
end

# give the people a form because they are silly
get '/:queue/new' do
  erb :new
end

