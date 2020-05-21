var HelloWorld = React.createClass({
  propTypes: {
    title: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>ようこそ〜: {this.props.title.last_name}</div>
      </div>
    );
  }
});
