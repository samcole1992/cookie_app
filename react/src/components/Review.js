import React, {Component} from 'react';

class Review extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    let body = null;
  

    if (this.props.body) {
      body = <span>{this.props.body}</span>;
    }

    return(
      <div>

        {this.props.rating} | {body}

      </div>
    );
  }
}

export default Review;
