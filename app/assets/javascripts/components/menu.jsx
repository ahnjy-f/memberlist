class Menu extends React.Component {
  // var Menu = React.createClass({
  
    constructor(props){
      super(props);
      this.state = {
      }
    }
  
      render() {
        return (
          <div>
            {this.props.value}
              <div><a href="/account">Home</a></div>
              <hr/>
              <div><a href="/account/postlist">投稿一覧</a></div>
              <hr/>
              <div><a href="/account/likelist">お気に入り一覧</a></div>
          </div>
        );
      }
    }
    