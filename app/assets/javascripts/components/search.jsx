var Search = React.createClass({

  getInitialState: function(){
      return{member:[]}
},
  onChangeName(e){ 
    this.setState({ name : e.target.value }) 
  },
  onClickSearch(){ 
    this.props.search(this.props.member.last_name) 
  },
  doSubmit(event){
    this.setState({
      member:Member.find(last_name)
    });
    event.preventDefault();
  },
  render: function() {
    return (
      <form onSubmit={this.doSubmit} action='/account/members/result'>
        <input type="text" value = {this.props.last_name} name = "name" size = "25"
        onChange = {(e)=>this.onChangeName(e)} placeholder = "姓を入力してください。" />
        <input type="submit" value="検索" onClick = {(e)=> this.onClickSearch(e)}/>
      </form>
    );
  }
});