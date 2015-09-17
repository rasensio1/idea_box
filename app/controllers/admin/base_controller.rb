class Admin::BaseController < ApplicationController
  before_action :require_admin
   

  def require_admin
    render text: "Sorry, only Admins belong here" unless current_admin?
  end
end
