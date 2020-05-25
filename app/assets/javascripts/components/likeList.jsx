var LikeList = React.createClass({

  render(){
    console.log("postlike/replylike- - - - - - - - - - - - - - - - - - -")
    
    let plike = this.props.postlike
    let rlike = this.props.replylike
    let cmember = this.props.current_member
    
    let p = plike.length 
    let r = rlike.length 

    console.log(plike[0].member_id ,p)
    console.log(rlike[0].member_id ,r)
    console.log(cmember.id)

    let data
    let hit =[]

    //current_memberの　postlikeとcreated_atを 配列hitへいれる
    for(let i=1; i < p; i++){
      console.log("★PPPost  ["+i+"] plike[i].member_id "+ plike[i].member_id +" == "+ cmember.id +":cmember.id  ...  "+plike[i].post_id+":plike[i].post_id  ...  length"+ p )
      
      if(plike[i].member_id == cmember.id){ 
        hit.unshift({
          post_id: plike[i].post_id,
          created_at: plike[i].created_at
        })
        console.log("hit")
        console.log(hit)
      }
    }

    //current_memberの　replylikeとcreated_atを　配列hitへいれる
    for(let j=1; j < r; j++){
      console.log("☆RRReply  ["+j + "] rlike[j].member_id "+ rlike[j].member_id +" == "+ cmember.id +":cmember.id  ...  "+rlike[j].reply_id+":rlike[j].reply_id  ...  length :"+ r )

      if(rlike[j].member_id == cmember.id){ 
        hit.unshift({
          reply_id: rlike[j].reply_id,
          created_at: rlike[j].created_at
        })
        console.log("hit")
        console.log(hit)
      }
    }

    //取得した配列hitをcreated_atの降順にソートし直す
    hit.sort((a, b) => {
      if (a.created_at < b.created_at) return 1;
      if (a.created_at > b.created_at) return -1;
      return 0;
    });
    console.log("hit のなかみ！")
    console.log(hit)
    console.log(hit[0].reply_id||hit[0].post_id,hit[0].created_at)

    //配列hitをdataへmapする
    let num =0
    data = hit.map((value)=>(
      console.log(hit[num]),
      <PostItem data={hit[num]} index={num++} post={this.props.post} reply={this.props.reply} member={this.props.member}/>
    ))

        
    return (
      <div>
        {data}
        
      </div>
    );
  }
});
