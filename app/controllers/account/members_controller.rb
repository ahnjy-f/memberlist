require "pp"
class Account::MembersController < Account::Base
    def index
        @current_account = current_account
        @current_member = current_member
        
        @member = Member.order(:first_name, :last_name)
        @member = @member.page(params[:page])
    end
    
    def detail
        @current_account = current_account
        @current_member = current_member
        
        @member = Member.find(params[:id])
        pp @member = Member.find(params[:id])
    end

    def show 
        @current_account = current_account
        @current_member = current_member
        @member = current_member
    end

    def edit
        @current_account = current_account
        @current_member = current_member
        @account = Account.find_by(id: session[:account_id])
        @member = current_member
    end

    def update
        @current_account = current_account
        @current_member = current_member
        @account = Account.find_by(id: session[:account_id])
        @member = current_member

        @member.assign_attributes(member_params)

        if @member.save

            @edithistory = MemberEditHistory.new(history_params)
            @edithistory.member_id = @member.id
            @edithistory.face_photo_path = @member.face_photo_path
            @edithistory.created_at = @member.created_at
            @edithistory.updated_at = DateTime.now
            @edithistory.save
            pp @edithistory

            flash.notice = "情報更新ができました。"
            redirect_to :account_member
        else
            render action: "edit"
        end
    end

    private def member_params
        params.require(:member).permit(
            :last_name, :last_name_phonetic, :first_name,
            :first_name_phonetic, :face_photo_path,
            :birth_year_month, :one_word_comment, :personality,
            :hobby, :favorite_things, :hate_things,
            :strong_point, :week_point, :special_skill,
            :week_things, :happy_done_things, :disgusted_things,
            :freedom_message
        )
    end

    private def history_params
        params.require(:member).permit(
            :member_id, :face_photo_path, :one_word_comment, :personality,
            :hobby, :favorite_things, :hate_things,
            :strong_point, :week_point, :special_skill,
            :week_things, :happy_done_things, :disgusted_things,
            :freedom_message, :created_at, :updated_at
        )
    end

end
