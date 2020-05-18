require "pp"
class Account::SessionsController < Account::Base
    def new
        if current_account
            pp "indexに行きます"
            
            redirect_to :account_root
        else
            @form = Account::LoginForm.new
            render action: "new"
        end
    end

    def create
        @form = Account::LoginForm.new(params[:account_login_form])

        if @form.mail_address.present?
            account_info =
                Account.find_by("LOWER(mail_address) = ? ", @form.mail_address.downcase)    
             pp account_info
        end

        if Account::Authenticator.new(account_info).authenticate(@form.password)
            pp "入りました"
            pp session
            session[:account_id] = account_info.id
            session[:account_admin_flag] = account_info.admin_flag
            pp "============="
            pp session[:account_admin_flag]
            pp "============="
            flash.notice = "ログイン完了"
            redirect_to :account_root
        else
            flash.alert = "メールアドレスか　パスワードが　正しくないです"
            render action: "new"
        end
    
    end

    def destroy
        pp "ログアウト"
        session.delete(:account_id)
        flash.alert = "ログアウトできました"
        redirect_to :account_root
    end

    def edit
    end

end
