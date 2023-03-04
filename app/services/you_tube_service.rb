class YouTubeService
  def self.get_video(country)
    request = conn.get("search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{country}")
    JSON.parse(request.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://www.googleapis.com/youtube/v3/") do |f|
      f.params['key'] = ENV['YOUTUBE_API_KEY']
    end
  end
end