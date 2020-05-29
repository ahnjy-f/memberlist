var Post = React.createClass({
  // propTypes: {
  //   current_member: React.PropTypes.string,
  // },
  getInitialState: function(){
    return {
        data: this.props.value,
    };
  },

  render() {
    //Post.id == Reply.post_id replyのデータ取得表示
    console.log("this.post.id- - - - - - - - - - - - - - - - - - -")
    console.log(this.props.index)
    let reply =this.props.reply
    
    let n = this.props.index-1  //post.length -1... post.id=０は存在しない為？
    let m = reply.length 

    let data
    let hit =[]

    for(let i=1; i < m; i++){
        if(reply[i].post_id-1==n){  //post_id -1... reply.id=０は存在しない為？  
          console.log(reply[i].id +"★hit! reply[" + reply[i].post_id +"] == n:" + n)
          
          hit.unshift(reply[i].id) //reply.post_id==post.id の時、 hitの配列の先頭にreply.id追加
          console.log(hit)

          let num = 0
          let anum = 0  
          data = hit.map((value)=>(
            anum = hit[num++],
            <Reply reply={reply[anum-1]} index={anum} member={this.props.member} /> 
            //index={hit[num++]} → {anum}へ <Reply/>に渡すreplyの配列を全て → 一つへ
          ));
        }
      }

    console.log("this.props.post[n].id"+this.props.post[n].id)
    let likeurl = "/account/post/" + this.props.post[n].id
    

    return (
      <div>
        <hr />
        <div>
          {this.props.index}
        </div>
        <div>
          <div>
            <GetMemberDate member={this.props.member} memberid={this.props.post[n].member_id}/>
              {/* <div>
                
              </div> */}
              <div>
                  <span>{this.props.post[n].post}</span>
              </div>
          </div>
          <div>
            <LikeButton url={likeurl} data={this.props.post[n].like}/>
            <button>Post[reply]</button>
          </div>
        </div>

        {data}

    </div>
    );
  }
});
