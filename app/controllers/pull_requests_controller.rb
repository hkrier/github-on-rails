class PullRequestsController < ApplicationController
  def form
  end

  def data
  end

  def find
    @user = params[:user]
    @repo = params[:repo]
    @pr_id = params[:pr_id]

    begin
      client = Octokit::Client.new(:access_token => Rails.application.secrets.github_api_key)
      @data = client.pull_request(@user << '/' << @repo, @pr_id)
      render 'data'
    rescue
      @error = 'Invalid User, Repository, or Pull Request ID'
      render 'form'
    end
  end
end
