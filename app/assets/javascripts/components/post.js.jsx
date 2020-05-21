var Post = React.createClass({
  // propTypes: {
  //   current_member: React.PropTypes.string,
  // },
  getInitialState: function(){
    return {
        data: this.props.value
    };
  },

  render: function() {
    return (
      <div>
        <div>
          Post[image]
        </div>
        <div>
          <div>
              <div>
                  Post[name]
              </div>
              <div>
                  <span>Post[text]</span>
              </div>
          </div>
          <div>
            <button>Post[like]</button>
            <button>Post[reply]</button>
          </div>
        </div>

        <hr />
        {/* replyを表示　posts.id == reply.post_id　の時　for文 */}
        <Reply />
    </div>
    );
  }
});
