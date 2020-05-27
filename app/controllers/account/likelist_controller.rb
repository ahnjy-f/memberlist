class Account::LikelistController < Account::Base
    def index
        @current_account = current_account
        @current_member = current_member
        @member = Member.all
        @post = Post.all
        @reply = Reply.order(created_at: :ASC)
        @postlike = Like.order(created_at: :ASC)
        @replylike = Replylike.order(created_at: :ASC)
    end
end
