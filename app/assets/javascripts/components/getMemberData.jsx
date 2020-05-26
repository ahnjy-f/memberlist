var GetMemberDate = React.createClass({
    getInitialState: function(){
        return {
            data: "state",
        };
      },

    render(){
        let member = this.props.member
        let ID = this.props.memberid
        let hit =[]

        for(let i=0; i < member.length; i++){
            // console.log(i + ":i "+ ID +": ID + length:"+ member.length )
            if(member[i].id==ID){ 
            hit.unshift(
                member[i].face_photo_path.url,
                member[i].last_name,
                member[i].first_name)
        //    console.log("hit")
        //    console.log(hit)
           break
            }
          }

        //hit... [0]last_name  [1]first_name  [2]face_photo_path.url
      return (
        <div>
            <div>
                <GetImage value={hit[0]} />
                {/* <img src={hit[0]} style={{width:"50px",borderRadius: 50,margin: 5}}/> */}
            </div>
            <div>
                {hit[1]}　{hit[2]}　
            </div>
        </div>
      );
    }
  });
  