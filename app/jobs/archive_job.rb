class ArchiveJob
  @queue = :archives

  def self.perform
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "VOID"
      config.consumer_secret     = "VOID"
    end
    tweets = client.user_timeline("callapatel")
    File.open("log/tweets-#{Time.now.to_s}.log", "w") do |file|
      file.puts Time.now.to_s
      tweets.each do |tweet|
        file.puts tweet.text
    end
    end
  end
end
