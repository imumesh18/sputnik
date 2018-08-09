class HistoryController < ApplicationController
  def index
  	@rejected_record = History.all#_by(:admin_id => session[:admin_id], :status => "Rejected")
  	@accepted_record = History.all#find_by(:admin_id => session[:admin_id], :status => "Accepted")
  end
end
