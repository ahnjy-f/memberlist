class Account::PostlistController < Account::Base
    def index
        @current_account = current_account
        @current_member = current_member
        @post = Member.all
        # render json: @post
    end
end
