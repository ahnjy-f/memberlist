var GetDate = React.createClass({

    render(){

      let splitYear = this.props.date
      splitYear = String(splitYear)
      let year = splitYear.slice(0,4)
      let month = splitYear.slice(5,7)
      let day = splitYear.slice(8,10)
      let time = splitYear.slice(11,16)
        
      return (
        <span>
            {year}.{month}.{day} {time}
        </span>
      );
    }
  });
  