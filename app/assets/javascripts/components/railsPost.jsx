var RailsPost = React.createClass({
  render() {
    console.log("this.props.value")
    console.log(this.props.value)
    return (
      <div>
        reactです
          {this.props.value}
        reactです
      </div>
    );
  }
});
