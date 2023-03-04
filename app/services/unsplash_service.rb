class UnsplashService
  def self.get_photos(country)
    request = conn.get("search/photos?query=#{country}")
    JSON.parse(request.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com/') do |f|
      f.params['client_id'] = ENV['UNSPLASH_API_KEY']
    end
  end
end
