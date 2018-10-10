class RecordsController < ApplicationController
    require 'date'
    load_and_authorize_resource

    respond_to :html, :js, :json
    before_action :set_record, only: [:show, :edit,
        :update, :destroy,
        :download, :print_view]

        # GET /records
        def index
            @records = Record.all.order(:updated_at)
        end

        # GET /records/1/download
        def download
            send_file view_context.download_record(@record)
        end

        # GET /records/1/print_view
        def print_view
        end

        # GET /records/1
        # GET /records/1.json
        def show
        end

        # GET /records/new
        def new
            respond_modal_with @record = Record.new
        end

        # GET /records/1/edit
        def edit
        end

        # POST /records
        # POST /records.json
        def create
            @record = Record.new(record_params)

            respond_to do |format|
                if @record.save
                    presente_id = Status.find_by(name: 'Presente').id


                    @record.sector.users.each do |user|


                        RecordsUser.create(user_id: user.id, record_id: @record.id, status_id: presente_id)

                    end
                    format.html { redirect_to edit_record_path(@record), notice: 'A ata foi criada com sucesso!' }
                end
            end
        end

        # PATCH/PUT /records/1
        # PATCH/PUT /records/1.json
        def update
            respond_to do |format|
                if @record.update_attributes(record_params)

                    falta_id = Status.find_by(name: 'Falta').id
                    atraso_id = Status.find_by(name: 'Atraso').id
                    @records_user = RecordsUser.where(record_id: @record.id)
                    admin  = User.all

                    teste=0

                    @records_user.each do |record_user|



                        if record_user.status_id === falta_id || record_user.status_id === atraso_id

                            admin.each do |admin|

                                if admin.role_id ===1

                                    EmailJob.perform_later(record_user.id,record_user.user_id,admin.email)

                                end

                            end

                        end


                    end
                    @record.update_attribute(:updated_at, Time.now)
                    format.html { redirect_to record_path(@record), notice: 'A ata foi atualizada com sucesso!' }
                end
            end
        end

        # DELETE /records/1
        # DELETE /records/1.json
        def destroy
            respond_to do |format|
                if @record.destroy
                    format.html { redirect_to records_path, notice: 'A ata foi excluída com sucesso!' }
                end
            end
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
                :discussion,
                records_users_attributes: [:id, :user_id, :status_id, :_destroy])
            end

        end
