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
            <div><a href="/account/post">Home</a></div>
            <div><a href="/account/postlist">投稿一覧</a></div>
            <div><a href="/account/likelist">お気に入り一覧</a></div>
        </div>
      );
    }
  }
  