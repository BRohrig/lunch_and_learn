class YouTubeFacade
  def self.find_video(country)
    Video.new(YouTubeService.get_video(country)[:items][0])
  end

end