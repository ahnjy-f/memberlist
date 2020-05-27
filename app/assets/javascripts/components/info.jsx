var Info = React.createClass({
  render(){
    return (
      <div>
        <p>{this.props.member.last_name}{this.props.member.first_name}</p>
        <p>{this.props.member.one_word_comment}</p>
      </div>
    )
  }
});