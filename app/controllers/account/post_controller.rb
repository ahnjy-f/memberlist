class Account::PostController < Account::Base
    def index
        #account/post 投稿ページ＞Homeの表示
        @current_account = current_account
        @current_member = current_member
        @member = Member.all
        @post = Post.all
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

        @current_account = current_account
        @current_member = current_member
        @member = Member.all
        @post = Post.all
        @reply = Reply.order(created_at: :ASC)
        render "index"
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

        @current_account = current_account
        @current_member = current_member
        @member = Member.all
        @post = Post.all
        @reply = Reply.order(created_at: :ASC)
        render "index"
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

