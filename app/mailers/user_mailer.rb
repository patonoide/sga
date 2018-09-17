class UserMailer < ApplicationMailer
    default from: ENV["GMAIL_USERNAME"]

    def email(id,user_id,email)

        falta_id = Status.find_by(name: 'Falta').id
        atraso_id = Status.find_by(name: 'Atraso').id
        noe_id = Sector.find_by(short_name: 'NOE').id
        ndp_id = Sector.find_by(short_name: 'NDP').id
        nam_id = Sector.find_by(short_name: 'NAM').id
        nut_id = Sector.find_by(short_name: 'NUT').id
        pc_id = Sector.find_by(short_name: 'PC').id
        cjr_id = Sector.find_by(short_name: 'CJR').id

        @records_user = RecordsUser.all.find(id)
        puts record_id = @records_user.record_id
        @records = Record.all.find(record_id)
        @date= Time.now



        @user = User.all.find(user_id)
        status = @records_user.status_id
        case @records.sector_id
        when noe_id
            @sector = "NOE"
        when ndp_id
            @sector = "NDP"
        when nam_id
            @sector = "NAM"
        when nut_id
            @sector= "NUT"
        when pc_id
            @sector= "PC"
        when cjr_id
            @sector = "CJR"
        end



        if status === falta_id
            @msg = "faltou"
        elsif status === atraso_id
            @msg = "atrasou"
        end

        assunto = @user.name + " "+@msg +" a reunião da/do "+ @sector




        mail(to: email , subject: assunto,charset:'UTF-8')


    end
end
