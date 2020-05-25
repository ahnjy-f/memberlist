var Home = React.createClass({
    render() {
    let data
    let n = this.props.post.length
      data = this.props.post.map((value)=>(
          <Post post={this.props.post} reply={this.props.reply} index={n--} member={this.props.member} />
      ));
    console.log(this.props.post_all)
    console.log(this.props.post)
        
    return (
      <div>
        <PostForm value={this.props.current_member}/>
        {data}
        
      </div>
    );
  }
});
