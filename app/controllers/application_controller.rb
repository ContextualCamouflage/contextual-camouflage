class ApplicationController < ActionController::Base
  include Pundit
  include IsCrawler
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found(exception)
    if Rails.env.production? && is_crawler?(request.user_agent)
      render_404
    else
      raise exception
    end
  end

  def render_404
    render file:   Rails.root.join('public', '404.html'),
           layout: nil,
           status: :not_found
  end
end
