var PostList = React.createClass({

    render(){
        let cmember = this.props.current_member
        let member = this.props.member
        let post = this.props.post
        let reply = this.props.reply
        let n = this.props.post.length
        let m = this.props.reply.length
        let data
        let hit = []
    
    console.log("this.props- - - - - - - - -postlist!!")
    console.log(this.props)

    for(let i= 0; i < n; i++){
        if(post[i].member_id==cmember.id){ 
            hit.unshift({
                post_id: post[i].id,
                created_at: post[i].created_at
            }) 
            console.log("postlist- - -hit post!")
            console.log(hit)
        }
    }
    for(let i= 0; i < m; i++){
        if(reply[i].member_id==cmember.id){
            
            hit.unshift({
                reply_id: reply[i].id,
                created_at: reply[i].created_at
            }) 
            
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
        console.log("★- - - ★hit[num]" + num),
        <PostItem data={hit[num]} index={num++} post={post} reply={reply} member={member}/>
     ))
    

    if(hit.length==0){
        return (
            <div>Post履歴がありません</div>
        )  
    }
        return (
        <div>
            {data}
        </div>
        );
    }
});
  