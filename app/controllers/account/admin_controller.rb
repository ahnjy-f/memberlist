require "pp"
class Account::AdminController < Account::Base

    def show
        if current_admin
        
        @m=Member.order(:id)
        
        else
            flash.alert="あなたは入れません"
            redirect_to :account_root 
        end
        @m = @m.page(params[:page])
        

    end

    def edit 
        
        if current_admin
            @m = Member.find(params[:id])
            
            else
                flash.alert="あなたは入れません"
                redirect_to :account_root 
            end
    end

    def update
        if current_admin
            @m = Member.find(params[:id])
            @m.assign_attributes(update_member_params)

            if @m.save!
                @m=Member.select("*")
                @m = @m.page(params[:page])
                flash.notice ="更新成功"
                redirect_to:account_admin_show
            else 
                pp "save"
                flash.alert="変更できませんでした"
                redirect_to:account_admin_show
            end
            
            else
                flash.alert="あなたは入れません"
                redirect_to :account_root 
        end
    end

    def new
        if current_admin
        
            @member = Member.new
            @member.build_account

            else
                flash.alert="あなたは入れません"
                redirect_to :account_root 
            end
    end

    def create
        if current_admin
            @member = Member.new(create_member_params)
            pp @member

            if @member.save
                flash.notice = "登録されました"
                redirect_to "/account/admin/show"
            else
                pp @member.errors
                flash.now.alert = "登録されませんでした"
                render action: "new"
            end  

            else
                flash.alert="あなたは入れません"
                redirect_to :account_root 
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
