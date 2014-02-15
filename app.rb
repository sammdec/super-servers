class App < Sinatra::Application

  get '/' do
    erb :index
  end

  post '/' do
    marvel = Marvel.new(ENV['MARVEL_PUBLIC_KEY'], ENV['MARVEL_PRIVATE_KEY'])
    @characters = marvel.rand_characters
    erb :index
  end
end