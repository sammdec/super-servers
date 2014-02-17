class App < Sinatra::Application

  get '/' do
    marvel = Marvel.new(ENV['MARVEL_PUBLIC_KEY'], ENV['MARVEL_PRIVATE_KEY'])
    @characters = marvel.rand_characters
    erb :index
  end

  helpers do
    def hostname(text)
      text.downcase.split(' (')[0].gsub(/\W+/, '_')
    end
  end
end