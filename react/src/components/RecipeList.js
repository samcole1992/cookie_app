import React, {Component} from 'react';
import Recipe from './Recipe';

class RecipeList extends Component {
  constructor(props){
    super(props);
    this.state= {
      recipes:[],
      recipe: null,
      type:'chocolate%20chip%20'
    };
// this.handleOptionChange = this.handleOptionChange.bind(this)
  }

//   handleOptionChange(changeEvent) {
//   this.setState({
//     recipe: changeEvent.target.value
//   });
// }

  componentDidMount(){
    // if (this.state.recipe== chocolateChip) {
    //   this.setState({
    //   type: 'chocolate%20chip%20'})
    // }
    // else if (this.state.recipe== peanutButter) {
    //   this.setState({
    //   type: 'peanut%20butter%20'})
    //     }
    // else if (this.state.recipe == sugar) {
    //   this.setState({
    //   type: 'sugar'})
    //     }
    // else if (this.state.recipe == oatmealRaisin) {
    //   this.setState({
    //   type:'oatmeal%20raisin%20'
    // })
    // }
    // else if (this.state.recipe == snickerDoodle) {
    //   this.setState({
    //
    //   type:'snickerdoodle%20'
    // })
    // }
    // else if (this.state.recipe== gingerbread) {
    //   this.setState({
    //
    //   type:'gingerbread%20'})
    //
    // }
    // else if (this.state.recipe== shortbread) {
    //   this.setState({
    //
    //   type:'shortbread%20'
    // })
    //
    // }
    fetch(`http://food2fork.com/api/search?key=06560de398a0c7f695ec038ce5ad9927&q=${this.state.type}cookies`,{
      mode: 'no-cors'
    })
    .then(response => {
      debugger;
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
      debugger;
      let newRecipes =[];
      response.forEach(function(recipe){
        newRecipes.push(recipe);

      });
      this.setState({
        recipes: newRecipes
      });
    });
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

 <div>
{recipes}
 </div>

    )
  }
}

export default RecipeList;
