import React, {Component} from 'react';

class Recipe extends Component {
  constructor(props){
    super(props);

  }

  render(){
    let recipe = <a href={`${this.props.recipe.url}`}>{this.props.recipe.title} </a>;
    let img = this.props.recipe.img_url
    return(
      <div>
        {recipe}
      </div>
    );
  }
}

export default Recipe;
