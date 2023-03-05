# frozen_string_literal: true

class YouTubeService
  def self.get_video(country)
    request = conn.get("search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=#{country}&maxResults=1")
    JSON.parse(request.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://www.googleapis.com/youtube/v3/') do |f|
      f.params['key'] = ENV['YOUTUBE_API_KEY']
    end
  end
end
