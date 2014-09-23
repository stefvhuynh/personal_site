class StaticPagesController < ApplicationController
  
  def home
    statsd = Statsd.new
    render :home
  end
  
end
