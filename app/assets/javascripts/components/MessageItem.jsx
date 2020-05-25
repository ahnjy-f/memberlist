var MessageItem = React.createClass ({
    render: function() {
      return (
        <div>
          <h2>{this.props.message.user}</h2>
        </div>
      );
    }
  });