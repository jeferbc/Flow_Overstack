class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :get_random_quote
def get_random_quote
    @search = Question.search(params[:q])
end
end
