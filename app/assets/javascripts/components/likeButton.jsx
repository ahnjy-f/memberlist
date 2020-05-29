var LikeButton = React.createClass({
render(){
    button = {
        fontSize: "0.8em",
        paddingLeft: 15,
        paddingRight: 15,
        borderRadius: 20,
        borderWidth: 1,
        borderColor: "#666666"
    }
    span = {
        fontSize: "0.6em",
        color: "#ff8C00"
    }
    
    return (
        <a href={this.props.url}>
            <button style={button}>いいね <span style={span}>{this.props.data}</span> </button>
        </a> 
    );
}
});
  