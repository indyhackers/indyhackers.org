class RedirectsController < ApplicationController
  def show
    redirect = Redirect.find(params[:id])
    redirect.visit!
    redirect_to redirect.url, status: :temporary_redirect
  end
end
