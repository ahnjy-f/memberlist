var PostList = React.createClass({
    // propTypes: {
    //     current_member: React.PropTypes.string
    // },

    render: function() {
        return (
        <div>
            {/* current_memberの持つpost+join+replyを表示。for文 */}
            <hr />
            <Post value={this.props.current_member}/>
        </div>
        );
    }
});
  