import React, {Component} from 'react';

class Recipe extends Component {
  constructor(props){
    super(props);

  }

  render(){
    let recipe = <a href={`${this.props.url}`}>{this.props.title} </a>;
    let img = this.props.img_url
    return(
      <div>
        {recipe}
      </div>
    );
  }
}

export default Recipe;
