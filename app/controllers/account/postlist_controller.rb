require "pp"
class Account::PostlistController < Account::Base
    def index

        @current_account = current_account
        @current_member = current_member
        @member = Member.includes(:posts).where(posts:{member_id:current_member.id})
        @post = Post.order(created_at: :ASC)
        @post_all=Post.order(created_at: :desc)
        @reply = Reply.order(created_at: :ASC)

    end
    def post
        p=Member.find(params[:id]);
        a=Post.new
        a.member_id=params[:id];
        a.assign_attributes(post_params);
        a.save;
        redirect_to:account_root;

    end
    
    def reply
        pp params[:id];
        pp "hello";
        a=Member.find(session[:account_id]);
        r=Reply.new;
        r.member_id=a.id;
        r.post_id=params[:id];
        pp r;
        r.assign_attributes(reply_params);
        r.save;
        redirect_to:account_root;
    end
    
    def post_like
     
        p=Post.find(params[:id]);
        a=Like.new
        a.member_id=current_member.id;
        b=current_member.likes;
        
        b=b.find_by(post_id:params[:id])
        pp "======"
        pp b;
        pp "======"
        if b==nil
            b=Like.new
        end
            
        if b.like==false
            pp "ok"
            p.like=p.like+1;
            p.update(like:p.like);
            b.like=true;
            b.post_id=params[:id];
            b.member_id=current_member.id
            pp b;
            b.update(like:b.like);
        else
            pp "no"
            p.like=p.like-1;
            pp p;
            p.update(like:p.like);
            b.like=false;
            b.post_id=params[:id];
            b.member_id=current_member.id
            pp b;
            b.update(like:b.like)
            pp "======"
            pp b;
            pp "======"

        end 
        redirect_to:account_root;
    end

    def reply_like
        p=Reply.find(params[:id]);
        a=Replylike.new
        a.member_id=current_member.id;
        b=current_member.replylikes;

        b=b.find_by(reply_id:params[:id])

        if b==nil
            b=Replylike.new
        end
        if b.like==false
            pp "ok"
            p.like=p.like+1;
            p.update(like:p.like);
            b.like=true;
            b.reply_id=params[:id];
            b.member_id=current_member.id
            pp b;
            b.update(like:b.like);
        else
            pp "no"
            p.like=p.like-1;
            pp p;
            p.update(like:p.like);
            b.like=false;
            b.reply_id=params[:id];
            b.member_id=current_member.id
            pp b;
            b.update(like:b.like)
            pp "======"
            pp b;
            pp "======"
        end 
        redirect_to:account_root;
    end

    def delete
        Post.find(params[:id]).replies.destroy_all
        pp Post.find(params[:id]).like.nil?
        if !Like.find_by(post_id:params[:id]).nil?
            Like.find_by(post_id:params[:id]).delete
        end
        Post.find(params[:id]).delete
        redirect_to:account_root;
    end
    def deletereply
        
        Reply.find(params[:id]).destroy;
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



