
var Detail = React.createClass({
  render(){
    let splitYear = this.props.member.joining_year
    splitYear = String(splitYear)
    let year = splitYear.slice(0,4)
    let month = splitYear.slice(4,6)
    let day = splitYear.slice(6,8)
    year　=　year　+ "年"
    month = month + "月"
    day = day + "日"

    let splitYear2 = this.props.member.birth_year_month
    splitYear2 = String(splitYear2)
    let year2 = splitYear2.slice(0,4)
    let month2 = splitYear2.slice(4,6)
    let day2 = splitYear2.slice(6,8)
    year2　=　year2　+ "年"
    month2 = month2 + "月"
    day2 = day2 + "日"

    return (
        
        <table className="detail">
          <tr>
            <td colSpan={2} >
              <img src={this.props.member.face_photo_path.url} className="icon rounded-circle" />
            </td>
          </tr>
          <tr>
            <td colSpan={2}>
                {this.props.member.last_name}{this.props.member.first_name}
            </td>
        </tr>
        <tr>
            <td colSpan={2}>   
                {year}{month}{day}に入社、
                {year2}{month2}{day2}生まれです！
            </td>
        </tr>
        <tr>
            <td colSpan={2}>
              {this.props.member.one_word_comment}
            </td>
        </tr>
     
        <tr>
            <th>性格</th>
            <th>趣味</th>
        </tr>
        <tr>
            <td>{this.props.member.personality}</td>
            <td>{this.props.member.hobby}</td>
        </tr>
        <tr>
            <th>好きなもの</th>
            <th>嫌いなもの</th>
        </tr>
        <tr>
            <td>{this.props.member.favorite_things}</td>
            <td>{this.props.member.hate_things}</td>
        </tr>
        <tr>
            <th>長所</th>
            <th>短所</th>
        </tr>
        <tr>
            <td>{this.props.member.strong_point}</td>
            <td>{this.props.member.week_point}</td>
        </tr>
        <tr>
            <th>得意なこと</th>
            <th>苦手なこと</th>
        </tr>
        <tr>
            <td>{this.props.member.special_skill}</td>
            <td>{this.props.member.week_things}</td>
        </tr>
        <tr>
            <th>されて嬉しいこと</th>
            <th>されたら嫌いなこと</th>
        </tr>
        <tr>
            <td>{this.props.member.happy_done_things}</td>
            <td>{this.props.member.disgusted_things}</td>
        </tr>
        <tr>
            <th colSpan={2}>自由記入</th>
        </tr>
        <tr>
            <td colSpan={2}>{this.props.member.freedom_message}</td>
        </tr>
        </table>
        

    )
  }
});