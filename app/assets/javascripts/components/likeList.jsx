var LikeList = React.createClass({

  render(){
    console.log("postlike/replylike- - - - - - - - - - - - - - - - - - -")
    
    let plike = this.props.postlike
    let rlike = this.props.replylike
    let cmember = this.props.current_member
    
    let p = plike.length
    let r = rlike.length

    let data
    let hit =[]

    //current_memberの　postlikeとcreated_atを 配列hitへいれる

    for(let i=0; i < p; i++){
      if(plike[i].member_id == cmember.id && plike[i].like==true){ 
        hit.unshift({
          post_id: plike[i].post_id,
          created_at: plike[i].created_at
        })
        console.log("hit")
        console.log(hit)
      }
    }
    
    //current_memberの　replylikeとcreated_atを　配列hitへいれる
    for(let j=0; j < r; j++){
      if(rlike[j].member_id == cmember.id&& rlike[j].like==true){ 
        hit.unshift({
          reply_id: rlike[j].reply_id,
          created_at: rlike[j].created_at
        })
        console.log("hit")
        console.log(hit)
      }
    }

    if(hit.length!=0){
    hit.sort((a, b) => {
      if (a.created_at < b.created_at) return 1;
      if (a.created_at > b.created_at) return -1;
      return 0;
    });
    
    //配列hitをdataへmapする
    let num =0
    console.log("入りました．");
    console.log(hit);
    
    data = hit.map((value)=>(
      console.log(hit[num]),
      <LikeItem data={hit[num]} index={num++} post={this.props.post} reply={this.props.reply} member={this.props.member}/>
    ))

      return (
        <div>
          {data}  
        </div>
      );
    }
    else if(hit.length==0){
      return (
        <div>
        いいね記録がありません
        </div>
      )
    }
        
  }
});
