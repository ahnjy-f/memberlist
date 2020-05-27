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
            pp current_admin
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

    def show
        # @members=Member.order(created_at: :desc);
        # @members=Member.where(posts:!nil).order(created_at: :desc);
        # pp @members=Member.joins(:posts).preload(:posts).where("posts IS NOT NULL").distinct.order(created_at: :desc);
        @members=Member.includes(:posts).references(:posts).order(created_at: :desc);
        @p=Post.order(created_at: :desc);
        @m=current_account;
        @current_account=current_account;
        @current_admin=current_admin;
        

        render action: "../top/index";
    end

end
