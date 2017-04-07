import React, {Component} from 'react';
import Recipe from './Recipe';

class RecipeList extends Component {
  constructor(props){
    super(props);
    this.state= {
      recipes:[],
      recipe: null,
      key:'06560de398a0c7f695ec038ce5ad9927',
      stateObject: {}
    };
  this.handleOptionChange = this.handleOptionChange.bind(this);
  this.getRecipes = this.getRecipes.bind(this);
  this.componentDidUpdate = this.componentDidUpdate.bind(this);
  }

  handleOptionChange(changeEvent) {
    debugger;
  this.setState({
    recipe: changeEvent.target.value,
    stateObject: this.state
  });
  }

getRecipes() {
  fetch(`http://food2fork.com/api/search?key=${this.state.key}&q=${this.state.recipe}cookies`,{

  })
  .then(response => {
    if (response.ok) {
      return response;
    }
    else {
      let errorMessage = `${response.status}, (${response.statusText})`;
      let error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.json())
  .then(response=> {
    this.setState({
      recipes: response.recipes
    })
  }).catch(error=> console.error(`Error in fetch: ${error.message}`))

  }

    componentDidUpdate(){
      if (this.state.recipe !== this.state.stateObject.recipe) {
        this.getRecipes();
        this.setState({
          stateObject: this.state
        })
      }

    }


  render(){
    let recipes;
    recipes = this.state.recipes.map((recipe)=>{
      return(
        <Recipe
        key = {recipe.recipe_id}
        url = {recipe.f2f_url}
        title = {recipe.title}
        rank = {recipe.social_rank}
        img_url = {recipe.image_url}
        />
      )
    })
    recipes;
    return(
  <form>
    <div className="radio">
      <label>
        <input type="radio" value="chocolate%20chip%20"
                     checked={this.state.recipe === 'chocolate%20chip%20'}
                     onChange={this.handleOptionChange} />
                Chocolate Chip
      </label>
    </div>
    <div className="radio">
     <label>
       <input type="radio" value="peanut%20butter%20"
                     checked={this.state.recipe === 'peanut%20butter%20'}
                     onChange={this.handleOptionChange} />
       Peanut Butter
      </label>
    </div>
    <div className="radio">
     <label>
       <input type="radio" value="sugar%20"
                     checked={this.state.recipe === 'sugar%20'}
                     onChange={this.handleOptionChange} />
       Sugar
     </label>
    </div>
    <div className="radio">
     <label>
       <input type="radio" value="oatmeal%20raisin%20"
                     checked={this.state.recipe === 'oatmeal%20raisin%20'}
                     onChange={this.handleOptionChange} />
       Oatmeal Raisin
     </label>
    </div>
    <div className="radio">
     <label>
       <input type="radio" value="snickerdoodle%20"
                     checked={this.state.recipe === 'snickerdoodle%20'}
                     onChange={this.handleOptionChange} />
       SnickerDoodle
     </label>
    </div>
   <div className="radio">
     <label>
       <input type="radio" value="gingerbread%20"
                     checked={this.state.recipe === 'gingerbread%20'}
                     onChange={this.handleOptionChange} />
       Gingerbread
     </label>
   </div>
   <div className="radio">
     <label>
       <input type="radio" value="shortbread%20"
                     checked={this.state.recipe === 'shortbread%20'}
                     onChange={this.handleOptionChange} />
       Shortbread
     </label>
   </div>
   <div className="radio">
     <label>
       <input type="radio" value=""
                     checked={this.state.recipe === ''}
                     onChange={this.handleOptionChange} />
       Random
     </label>
   </div>
 </form>
//  <div>
// {recipes}
//  </div>

    )
  }
}

export default RecipeList;
