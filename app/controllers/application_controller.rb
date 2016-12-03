class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :create_ransack_object
  def create_ransack_object
      @search = Question.ransack(params[:q])
  end
end
