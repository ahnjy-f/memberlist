var LikeButton = React.createClass({
    // propTypes: {
    //     current_member: React.PropTypes.string
    // },
    // 'いいね',"/account/post_like/"+post.id.to_s 

    render: function() {
      return (
        <div>
            <a href={this.props.url}><button>いいね</button></a> {this.props.data}
        </div>
      );
    }
  });
  