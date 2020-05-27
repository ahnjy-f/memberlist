require "pp"
class Account::PasswordsController < Account::Base
    def edit
        pp "一応入りました"
        pp current_account
        @change_password_form = Account::ChangePasswordForm.new(object: current_account)
        pp "editに入りました"   
        pp "情報"
        pp @change_password_form
        pp "=========================="
        @current_account = current_account
        @current_member = current_member
    end
    
    def update
        pp "いらっしゃいませ！"
        @change_password_form = Account::ChangePasswordForm.new(account_password_params)
        @change_password_form.object = current_account
        
        if @change_password_form.save
            flash.notice = "変更されました"
            redirect_to :account_root
        else
            flash.alert = "PassWord 変更失敗"
            render action: "edit"
        end
    end

    def account_password_params
        params.require(:account_change_password_form).permit(
            :current_password, :new_password, :new_password_confirmation
        )
    end
end
