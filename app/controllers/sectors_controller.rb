class SectorsController < ApplicationController

  respond_to :json

  def records
    @records = Sector.find(params[:id]).records
  end

end