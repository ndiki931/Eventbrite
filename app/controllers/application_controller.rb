# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      flash[:notice] = 'You must be connected to create an event.'

      redirect_to new_user_session_path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
end
