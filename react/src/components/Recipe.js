import React, {Component} from 'react';

class Recipe extends Component {
  constructor(props){
    super(props);
    this.state: {
      recipes:[],
      recipe: null,
      type:'',
      key:ENV["FOOD2FORK_KEY"]
    };
this.handleOptionChange = this.handleOptionChange.bind(this)
  }

  handleOptionChange: function (changeEvent) {
  this.setState({
    recipe: changeEvent.target.value
  });
},

  componentDidMount(){
    if (this.state.recipe== chocolateChip) {
      this.setState({
      type: 'chocolate%20chip%20'})
    }
    else if (this.state.recipe== peanutButter) {
      this.setState({
      type: 'peanut%20butter%20'})
        }
    else if (this.state.recipe == sugar) {
      this.setState({
      type: 'sugar'})
        }
    else if (this.state.recipe == oatmealRaisin) {
      this.setState({
      type:'oatmeal%20raisin%20'
    })
    }
    else if (this.state.recipe == snickerDoodle) {
      this.setState({

      type:'snickerdoodle%20'
    })
    }
    else if (this.state.recipe== gingerbread) {
      this.setState({

      type:'gingerbread%20'})

    }
    else if (this.state.recipe== shortbread) {
      this.setState({

      type:'shortbread'
    })
    
    }
    fetch(`http://food2fork.com/api/search?key=${key}&q=${type}cookies`,{})
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
        <a href={``}

        />
      )
    })
    return(
      <form>
   <div className="radio">
     <label>
       <input type="radio" value="chocolateChip"
                     checked={this.state.recipe === 'chocolateChip'}
                     onChange={this.handleOptionChange} />
       Chocolate Chip
     </label>
   </div>
   <div className="radio">
     <label>
       <input type="radio" value="peanutButter"
                     checked={this.state.recipe === 'peanutButter'}
                     onChange={this.handleOptionChange} />
       Peanut Butter
     </label>
   </div>
   <div className="radio">
     <label>
       <input type="radio" value="sugar"
                     checked={this.state.recipe === 'sugar'}
                     onChange={this.handleOptionChange} />
       Sugar
     </label>
   </div>
   <div className="radio">
     <label>
       <input type="radio" value="oatmealRaisin"
                     checked={this.state.recipe === 'oatmealRaisin'}
                     onChange={this.handleOptionChange} />
       Oatmeal Raisin
     </label>
   </div>
   <div className="radio">
     <label>
       <input type="radio" value="snickerDoodle"
                     checked={this.state.recipe === 'snickerDoodle'}
                     onChange={this.handleOptionChange} />
       SnickerDoodle
     </label>
   </div>
   <div className="radio">
     <label>
       <input type="radio" value="gingerbread"
                     checked={this.state.recipe === 'gingerbread'}
                     onChange={this.handleOptionChange} />
       Gingerbread
     </label>
   </div>
   <div className="radio">
     <label>
       <input type="radio" value="shortbread"
                     checked={this.state.recipe === 'shortbread'}
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
    )
  }
}

export default Recipe;
