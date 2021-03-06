require "pp"
class Account::AdminController < Account::Base

    def show
        if current_admin
            @m=Member.order(:id)
            @m = @m.page(params[:page])
            pp params[:category]
            
            if params[:category].to_s == '1'
                @m=Member.order(:id)
                @m = @m.page(params[:page])
            elsif params[:category].to_s == '2'
                @m=Member.order('last_name COLLATE "C" ASC')
                @m = @m.page(params[:page])
            elsif params[:category].to_s == '3'
                @m=Member.order('last_name_phonetic COLLATE "C" ASC')
                @m = @m.page(params[:page])
            end
        else
            flash.alert="あなたは入れません"
            redirect_to :account_root 
        end
        
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

            if @member.save
                if @member.face_photo_path.nil?
                    @member.face_photo_path = "default_icon.jpg"
                end
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

    def result
        pp "検索を始めます。"
        @searches = Member.where('created_at >= :years_ago', :years_ago => Time.now-60.years).where("last_name ilike '%#{params[:search_text]}%'").order(:id)
        # @searches = eval(params[:model]).where('created_at >= :years_ago', :years_ago => Time.now-60.years).where("last_name LIKE ? '%#{params[:search_text]}%'")
        pp @searches
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
            :first_name_phonetic, :deleted_at, :birth_year_month, :joining_year,
            account_attributes:[
                :mail_address,
                :password,
                :admin_flag,
                :id
            ]
        )
    end
end
