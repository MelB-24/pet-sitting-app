module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_sitter_user
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(rails_sitter_user.dashboard_path) && return
    elsif current_owner_user
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(authenticated_owner_user_root_path) && return
    end
  end
end