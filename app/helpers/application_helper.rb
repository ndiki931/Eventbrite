# frozen_string_literal: true

module ApplicationHelper
  def authenticate_user
    unless current_user
      # @user = User.new

      redirect_to new_user_session_path
    end
  end
end
