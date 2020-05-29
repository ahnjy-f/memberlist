var MessageForm = React.createClass({
  handleSubmit: function(event) {
    event.preventDefault();
    var user = this.refs.user.value.trim();
    // 親コンポーネントのMessageBocのイベントを呼び出す
    this.props.onMessageSubmit( user );
    // フォームの内容を削除
    this.refs.user.value = '';
  },

 // 投稿用のフォームを作成して、'user'として内容を受け取る
  render: function() {
    return (
      <form className="commentForm" onSubmit={this.handleSubmit}>
        {/* <input type="textarea" placeholder="今の気持ちをポストしてみましょう" ref='user'/> */}
        <textarea  rows="4" cols="40" ref='user' placeholder="今の気持ちをポストしてみましょう"/>
        <input type="submit" value="Post" />
      </form>
    );
  }
});