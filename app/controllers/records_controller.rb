class RecordsController < ApplicationController

  respond_to :html, :js
  before_action :set_record, only: [:show, 
                                    :edit, 
                                    :update, 
                                    :destroy, 
                                    :download]

  # GET /records
  def index
  end

  # POST /select_sector_records
  def select_sector_records
    @sector = Sector.find(params[:sector][:id])
    session[:sector_id] = @sector.id
  end

  # GET /records/1/download
  def download
    send_file view_context.download_record(@record)
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @sector = Sector.find(params[:sector_id])
    records = @sector.records

    unless records.blank?
      @number = records.last.number + 1
    else
      @number = 1
    end

    @record = Record.new(sector_id: params[:sector_id])
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @sector = Sector.find(record_params[:sector_id])
    @record = Record.new(record_params)
    @records = @sector.records

    respond_to do |format|
      if @record.save
        format.html { redirect_to record_path(@record), notice: 'A ata foi criada com sucesso!' }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update_attributes(record_params)
        @record.update_attribute(:updated_at, Time.now)
        format.html { redirect_to record_path(@record), notice: 'A ata foi atualizada com sucesso!' }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @sector = @record.sector
    @record.destroy
    @records = @sector.records
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:date, 
             :sector_id,
             :number,
             record_users_attributes: [:id, :user_id, :status_id, :_destroy],
             discussions_attributes: [:id, :name, :content, :_destroy])
    end

end
