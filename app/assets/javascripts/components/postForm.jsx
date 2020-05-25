var PostForm = React.createClass({
    // propTypes: {
    //   current_member: React.PropTypes.string
    // },
    getInitialState: function(){
      return {
          data: "state",
          path: this.props.value.face_photo_path.url
      };
    },
  
    render(){

      let cmember = this.props.value
      console.log("cmember")
      console.log(cmember)

      return (
      <div>
          <div>
              <div>
                <img src={this.state.path} style={{width:"50px"}}/>
              </div>
              <div>
                  <div>
                      <div>
                      {cmember.last_name} {cmember.first_name}  
                      </div>
                      <div>
                        state...{this.state.data}
                        <MessageBox cmember={this.props.value}/>
                        {/* form */}
                        {/* <form onSubmit={this.handleSubmit}>
                        <textarea placeholder="Title" ref='user' minlength="1" maxlength="140" size="20" required /> */}
                            {/* <button onClick={this.doClick}>post</button> */}
                            {/* <input type="submit" value="Post" />
                        </form> */}
                          <span>PostForm[text]</span>
                      </div>
                      <div>
                          <button>PostForm[post]</button>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      );
    }
  });
  