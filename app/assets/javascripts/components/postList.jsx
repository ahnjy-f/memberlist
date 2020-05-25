var PostList = React.createClass({

    render(){
        let cmember = this.props.current_member
        let member = this.props.member
        let post = this.props.post
        let reply = this.props.reply
        let n = this.props.post.length
        let data
        let hit = []
    
    console.log("this.props- - - - - - - - -postlist!!")
    console.log(this.props)
    console.log(post[0].member_id)

    for(let i= 0; i < n; i++){
        console.log(i + ":::i   cmember.id:"+cmember.id+"== "+ post[i].member_id +":::id  n::"+n)
        if(post[i].member_id==cmember.id){  
            console.log(i +" ★hit! post[i].member_id[" + post[i].member_id +"] == "+ cmember.id +":cmember.id  length" + n)
            
            hit.unshift({
                post_id: post[i].id,
                created_at: post[i].created_at
            }) 
            console.log("postlist- - -hit post!")
            console.log(hit)
        }
    }
    for(let i= 0; i < n; i++){
        console.log(i + ":::i   cmember.id:"+cmember.id+"== "+ reply[i].member_id +":::reply[i]member_id  n::"+n)
        if(reply[i].member_id==cmember.id){  
            console.log(i +" ★hit! reply[i].member_id[" + reply[i].member_id +"] == "+ cmember.id +":cmember.id  length" + n)
            
            hit.unshift({
                reply_id: reply[i].id,
                created_at: reply[i].created_at
            }) 
            console.log("postlist hitのなかみ！！！")
            console.log(hit[0])
            console.log(hit[1])
            console.log(hit[2])
            console.log(hit[3])
        }
    }
    //取得した配列hitをcreated_atの降順にソートし直す
    hit.sort((a, b) => {
    if (a.created_at < b.created_at) return 1;
    if (a.created_at > b.created_at) return -1;
    return 0;
    });

    //配列hitをdataへmapする
    let num =0 
    data = hit.map((value)=>(
        console.log("num"+num),
        console.log(hit[0]),
            console.log(hit[1]),
            console.log(hit[2]),
            console.log(hit[3]),
      <PostItem data={hit[0]} index={num++} post={post} reply={reply} member={member}/>
    ))
    //★問題 data={hit[0]}→data={hit[num]}にしたい
    
        return (
        <div>
            <hr />
            {data}
        </div>
        );
    }
});
  