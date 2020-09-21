var Records = React.createClass({
  //컴포넌트의 초기 상태를 생성해줌
  getInitialState: function() {
    return { records: this.props.data };
  },
  //컴포넌트를 아무런 데이터 없이 생성하는 경우 기본 속성값 설정
  getDefaultProps: function(){
    return { records: [] }
  },
  //render 함수를 이용해 나타낼 화면 표시
  render: function(){
    return(
      <div className="records">
        <h2 className="title"> Records </h2>
      </div>
    );
  }
});