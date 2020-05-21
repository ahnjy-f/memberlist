var Menu = React.createClass({
    // propTypes: {
    //     current_member: React.PropTypes.string
    // },

    render: function() {
      return (
        <div className="div">
            <div><a href="/account/post">Home</a></div>
            <div><a href="/account/postlist">投稿一覧</a></div>
            <div><a href="/account/likelist">お気に入り一覧</a></div>
        </div>
      );
    }
  });
  