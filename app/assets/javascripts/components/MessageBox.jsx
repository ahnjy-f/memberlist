var MessageBox = React.createClass({

    getInitialState: function() {
      // isLoading = true : ロード中を表示
      return { messages: [], isLoading: true };
    },
    updateName(name) {
      this.setState({ name: name });
    },
  
    handleSubmit(event) {
      event.preventDefault();
      actions.saveName(this.state.name);
    },
  
    render() {
      return (
        <div>
          <h3>Hello, {this.state.name}!</h3>
          <form>
            <label htmlFor="name">Say hello to:</label>
            <textarea
              id="name"
              type="text"
              value={this.state.name}
              onChange={e => this.updateName(e.target.value)}
            />
  
            <input
              type="submit"
              value="Submit"
              onClick={event => this.handleSubmit(event)}
            />
          </form>
        </div>
      );
    }
  });

  
  //  // 投稿の内容をAjaxでPOST
  //   handleMessageSubmit: function(message) {
      
  //     $.ajax({
  //       url: '/account/post/create/'+ this.props.cmember.id,
  //       datatype: 'json',
  //       type: 'POST',
  //       beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
  //       data: {
  //         micropost: { content: message }
  //       },
  //       success: function(message) {
  //         var newMessages = this.state.messages.concat(message);
  //         this.setState({ messages: newMessages });
  //       }.bind(this),
  //       error: function(_xhr, status, err) {
  //         console.error(this.props.url, status, err.toString());
  //       }.bind(this)
  //     });
  //   },
  
  //   render: function() {
  //     console.log("！！！！cmember.id！！！！！")
  //     console.log(this.props.cmember.id)
  //     var messageItems = this.state.messages.map(function(message) {
  //       return (
  //         <MessageItem key={message.id} message={message}/>
  //       );
  //     });
  
  //   // ボタンがクリックされた時に、投稿する内容を受け取ってhandleMessageSubmitに渡す
  //     return (
  //       <div>
  //         <div>
  //           {messageItems}
  //           <MessageForm onMessageSubmit={this.handleMessageSubmit} cmember={this.props.cmember}/>
  //         </div>
  //       </div>
  //     );
  //   }
  // });