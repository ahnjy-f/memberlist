var PostForm = React.createClass({
    // propTypes: {
    //   current_member: React.PropTypes.string
    // },
    getInitialState: function(){
      return {
          data: this.props.value,
          path: "assets/"+this.props.value.face_photo_path+".jpg"
      };
    },
  
    render: function() {
      return (
      <div>
          <div>
              <div>
                PostForm[image]<img src={this.state.path}/>
              </div>
              <div>
                  <div>
                      <div>
                      postForm[name]:{this.state.data.first_name}{this.state.data.last_name}
                      </div>
                      <div>
                        <form>
                            <input type="text" minlength="1" maxlength="140" size="20" onChange={this.doChange} value={this.state.data} required />
                            <button onClick={this.doFetch}>post</button>
                        </form>
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
  