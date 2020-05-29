var Picture = React.createClass({

  render(){
    
    let url = "/account/members/" + this.props.member.id + "/detail"
    console.log(this.props.member.id)
    return (
      <div>
        <a href={url}>
        <img src={this.props.member.face_photo_path.url} className="icon rounded-circle" />
        </a>
        </div>
    )
  }
});