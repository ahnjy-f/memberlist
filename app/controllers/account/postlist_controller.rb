require "pp"
class Account::PostlistController < ApplicationController
        def index
            @current_account = current_account
            @current_member = current_member
            @post = Member.all
            # render json: @post
        end
    def post
        a=Member.find(params[:id]);
        p=Post.new
        p.member_id=params[:id];
        p.assign_attributes(post_params);
        p.save;
        pp p;
        redirect_to:account_root;
    end
    def reply
          pp params[:id]
        pp "hello"
        a=Member.find(session[:account_id]);
        r=Reply.new
        r.member_id=a.id;
        r.post_id=params[:id];
        pp r;
        r.assign_attributes(reply_params);
        r.save;
        redirect_to:account_root;
    end

    private def post_params
        params.require(:post).permit(
            :post
        )
    end
    private def reply_params
        params.require(:reply).permit(
            :reply
        )
    end
end
