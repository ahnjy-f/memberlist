var LikeItem = React.createClass({
  
    render(){

        console.log("this.props.data postItem - - - - - - - - - - -- - ")
        console.log(this.props)
        let data = this.props.data
        let post = this.props.post
        let reply = this.props.reply
        console.log(post)
        console.log(reply)
        
        let id 
        let hit = []

        if(data.post_id){
            id = data.post_id
            idname = "post_id :" + data.post_id

            for(let i=0; i < post.length; i++){
                console.log("for post")
                if(post[i].id==id){
                    console.log("if post")
                    console.log(post[i].id +"★hit! post.id[" + post[i].id +"] == ["+ id +"]:id   length:" + post.length)
                    
                    let likeurl = "/account/post/" + this.props.post[i].id

                    hit.push({
                        data: post[i],
                        content: post[i].post,
                        likeurl: likeurl
                    })
                    console.log("hit")
                    console.log(hit)
                    
                  break
                }
            }

        }else{
            id =  data.reply_id
            idname = "reply_id :" + data.reply_id

            for(let i=0; i < reply.length; i++){
                console.log("for reply")
                if(reply[i].id==id){
                    console.log("if reply")
                    console.log(reply[i].id +"★hit! reply[" + reply[i].id +"] == ["+ id +"]:id   length:"+ reply.length)
                    
                    let likeurl = "/account/post/reply/" + this.props.reply[i].id
                    
                    hit.push({
                    data: reply[i],
                    content: reply[i].reply,
                    likeurl: likeurl
                    })

                    console.log("hit")
                    console.log(hit)
                    break
                }
            }
        }
        
        div = {
            display: 'inline-block',
            width: "800px",
            border: "1px solid #cccccc",
            padding: 10,
            margin: 5
        };
        right = {
            padding: 5,
            textAlign: "right" 
        };
        content={
            lineHeight:2,
            minHeight: "90px"
        }
        fontSizeS = {
            fontSize: "0.6em",
        };
        fontSizeM = {
            fontSize: "1em",
        };
        tdleft = {
            width: "180px"
        };
        tdright = {
            width: "600px",
            textAlign: "left"
        };
        
      return (
        <div style={div}>
            <table>
                <tr>
                    <td style={tdleft}>
                        <GetMemberDate member={this.props.member} memberid={hit[0].data.member_id}/>
                    </td>
                    <td style={tdright}>
                        <div style={content}>
                            {hit[0].content}
                        </div>
                        <div style={right}>
                            <span style={fontSizeS}>
                                [{idname}]&nbsp;&nbsp;
                                <GetDate date={data.created_at} />&nbsp;&nbsp;
                            </span> 
                            <LikeButton url={hit[0].likeurl} data={hit[0].data.like} />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
      );
    }
  });
  
  