configure :development do
  ActiveRecord::Base.establish_connection(YAML.load_file("./config/database.yml")['development'])
end

configure :test do
  ActiveRecord::Base.establish_connection(YAML.load_file("./config/database.yml")['test'])
end

configure :production do

 db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
   
  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
    )
end
