var GetMemberDate = React.createClass({
    // propTypes: {
    //     current_member: React.PropTypes.string
    // },
    // 'いいね',"/account/post_like/"+post.id.to_s 
    getInitialState: function(){
        return {
            data: "state",
        };
      },

    render(){
        let member = this.props.member
        let ID = this.props.memberid

        let data
        let hit =[]
        for(let i=0; i < member.length; i++){
            console.log(i + ":i "+ ID +": ID + length:"+ member.length )
            if(member[i].id==ID){ 
            hit.unshift(
                member[i].last_name,
                member[i].first_name,
                member[i].face_photo_path.url)
           console.log("hit")
           console.log(hit)
           break
            }
          }

        //hit... [0]last_name  [1]first_name  [2]face_photo_path.url
      return (
        <div>
            <div>
                <img src={hit[2]} style={{width:"50px"}}/>
            </div>
            <div>
                {hit[0]}　{hit[1]}　
            </div>
        </div>
      );
    }
  });
  