class ApplicationController < ActionController::Base
  def health
    render plain: 'OK'
  end
end
