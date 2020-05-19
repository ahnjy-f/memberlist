require "pp"
class Account::AdminController < Account::Base

    def show
        if current_admin
        
        @m=Member.select("*")
        
        else
            flash.alert="あなたは入れません"
            redirect_to :account_root 
        end
        @m = @m.page(params[:page])
        

    end

    def edit 
        @m = Member.find(params[:id])
    end

    def update
        @m = Member.find(params[:id])
        @m.assign_attributes(update_member_params)
        pp @m.account
        pp @m
        if @m.save!
            pp "saveしました"
            @m=Member.select("*")
            @m = @m.page(params[:page])
            flash.notice ="更新成功"
            redirect_to:account_admin_show
        else
            pp "save"
            flash.alert="変更できませんでした"
            redirect_to:account_admin_show
        end
    end

    def new
        @member = Member.new
        @member.build_account
    end

    def create
        @member = Member.new(create_member_params)
        pp @member
        
            if @member.save
                @member.face_photo_path = "2"
                flash.notice = "登録されました"
                redirect_to "/account/admin/show"
            else
                pp @member.errors
                flash.now.alert = "登録されませんでした"
                render action: "new"
            end
    end



    private def create_member_params
        params.require(:member).permit(
            :last_name, :last_name_phonetic, :first_name,
            :first_name_phonetic, :face_photo_path,
            :birth_year_month, :joining_year, :one_word_comment, :personality,
            :hobby, :favorite_things, :hate_things,
            :strong_point, :week_point, :special_skill,
            :week_things, :happy_done_things, :disgusted_things,
            :freedom_message,
            account_attributes: [
                :member_id,
                :mail_address,
                :password,
                :admin_flag
            ]
        )
    end

    private def update_member_params
        params.require(:member).permit(
            :last_name, :last_name_phonetic, :first_name,
            :first_name_phonetic,
            account_attributes:[
                :mail_address,
                :password,
                :admin_flag,
                :id
            ]
        )
    end
end
