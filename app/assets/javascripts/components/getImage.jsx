var GetImage = React.createClass({
    render(){
      return (
        <div>
            <img src={this.props.value} style={{width:"50px",borderRadius: 50,margin: 5}}/>
        </div>
      );
    }
  });
  