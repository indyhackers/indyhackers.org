class RedirectController < ApplicationController
  def show
    redirect = Redirect.find(params[:id])
    redirect_to redirect
  end
end
