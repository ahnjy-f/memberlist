var Home = React.createClass({
  // propTypes: {
  //   current_member: React.PropTypes.string
  // },
  // Home.defaultProps = {
  //   name: '管理者'
  // };

  render: function() {
    return (
      <div>
         <hr/>
        <PostForm value={this.props.current_member}/>
         <hr/>
        <Post value={this.props.current_member}/>
      </div>
    );
  }

});
