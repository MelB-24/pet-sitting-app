class PagesController < ApplicationController
  def home
  end

  def sitter
    store_location_for(:sitter_user, request.fullpath)
  end

  def owner
    store_location_for(:owner_user, request.fullpath)
  end
end
