require 'debugger'

get '/' do
  erb :index
end

post '/tweet' do
  p params
  # begin
    p CLIENT.update(params["tweet"]).text
  #   puts "Returned stuff: " + returned_message
  # rescue
  #   puts "Rescued. Message: " + returned_message
  #   returned_message
end

post '/tweets' do
  u = CLIENT.user(params["username"])
  @user = TwitterUser.find_or_create_by(username: u.username)
  if @user.tweets.empty? || @user.tweets_stale?
    @user.fetch_tweets!
  end
  @tweets = @user.tweets.order(created_at: :asc)
end

# get '/:username' do
#   erb :user_tweets
# end
