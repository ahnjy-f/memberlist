var Reply = React.createClass({

  render: function() {
  let n = this.props.index
  let reply = this.props.reply
  console.log(this.props)

  console.log("this.props.post[n].id"+this.props.reply.id)
  let likeurl = "/account/post/reply/" + this.props.reply.id

    return (
      <div>
          
         [{n}]
         {this.props.reply.id} : {reply.post_id} 
          <div>
          reply[image]
          </div>
          <div>
              <div>
              <GetMemberDate member={this.props.member} memberid={this.props.reply.member_id}/>
                  <div>
                      <span>{reply.reply}</span>
                  </div>
              </div>
          </div>
          <div>
          <LikeButton url={likeurl} data={reply.like}/>
          </div>
      </div>
    );
  }
});

