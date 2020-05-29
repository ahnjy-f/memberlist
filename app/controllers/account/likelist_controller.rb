class Account::LikelistController < Account::Base
    def index
        @current_account = current_account
        @current_member = current_member
        @member = Member.all
        @post = Post.order(created_at: :ASC)
        @reply = Reply.order(created_at: :ASC)
        @postlike = Like.order(created_at: :ASC)
        @replylike = Replylike.order(created_at: :ASC)
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
        redirect_to:account_likelist_index;
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
        redirect_to:account_likelist_index;
    end

end
