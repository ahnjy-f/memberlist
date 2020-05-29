var PostForm = React.createClass({
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
  