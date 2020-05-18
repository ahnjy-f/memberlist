class Account::Base < ApplicationController
    
    private def current_account
        pp "ログインできたのか確認中"
        if session[:account_id]
            @current_account ||=
                Account.find_by(id: session[:account_id])
        end
    end

    private def current_admin 
        if session[:account_admin_flag] == "1"
            pp "you are admin"
            true
        else
            false
        end
    end

    def current_member
        if session[:account_id]
            @current_member ||=
                Member.find_by(id: session[:account_id])
        end
    end
    
    helper_method :current_account
end 