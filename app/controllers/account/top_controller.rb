require "pp"
class Account::TopController < Account::Base
    
    def index
        if current_account
            pp "ログイン成功"
            @current_account = current_account
            @current_member = current_member
            redirect_to :account_show
        else

            pp "hello"
            pp "login ページに戻ります"
            redirect_to :account_login
        end
    end

    def certification
        @mail_certificate = params[:mail_address]
        @birthday_certificate = params[:birth_year_month]
    end

    def change
        @search_account = Account.find_by(mail_address: params[:mail_address])
        pp @search_account

        pp "メールアドレスを確認中です。"
        # pp @search_account.id
        pp @birthday_certificate
        pp params[:mail_address]

        if @search_account
            finder_id = @search_account.member_id
            finder = Member.find(finder_id)
            pp finder.birth_year_month.to_s
            pp params[:birth_year_month]
            @birth_certificate = params[:birth_year_month]
            
            if finder.birth_year_month.to_s == @birth_certificate.to_s
                flash.alert = "認証に成功しました"
                @search_account = Account.find_by(mail_address: params[:mail_address])
            else
                flash.alert = "認証が不正確です。情報を確認してください。"
                redirect_to :account_login
            end
        else
            flash.alert = "メールを確認してください"
            redirect_to :account_login
        end
    end

    def update
        
        @search_account = Account.find(params[:id])
        @search_account.assign_attributes(account_password_params)
        
        if @search_account.save
            flash.notice = "パスワード変更されました。"
            redirect_to :account_login
        else
            flash.alert = "パスワード変更に失敗しました"
            render :account_login
        end
    end

    def account_password_params
        params.require(:account).permit(
            :password
        )
    end
end
