class RepositoriesController < ApplicationController
  # def index ##test passing version
  #   response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
  #   @repos_array = JSON.parse(response.body)
  # end

  def index #version that actually uses the given #get_repos
    github = GithubService.new({'access_token' => session[:token]})
    @repos_array = github.get_repos
  end

  # def create ##test passing version
  #   response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
  #   redirect_to '/'
  # end

  def create #version that actually uses the given #create_repo(name)
    github = GithubService.new({'access_token' => session[:token]})
    github.create_repo(params[:name])
    redirect_to '/'
  end

end
