import React, {Component} from 'react';

class Recipe extends Component {
  constructor(props){
    super(props);
    this.state: {
      recipes:[],
      recipe: null
    };
this.handleRadioChange = this.handleRadioChange.bind(this)
  }

  handleRadioChange = (event)=>{
    this.setState({
      recipe: event.currentTarget.value
    })
  }

  componentDidMount(){
    let key = ENV["FOOD2FORK_KEY"]
    let type = '';
    if (this.state.recipe== chocolateChip) {
      type = 'chocolate%20chip%20'
    }
    else if (this.state.recipe== peanutButter) {
      type = 'peanut%20butter%20'
    }
    else if (this.state.recipe == sugar) {
      type = 'sugar%20'
    }
    else if (this.state.recipe == oatmealRaisin) {
      type = 'oatmeal%20raisin%20'
    }
    else if (this.state.recipe == snickerDoodle) {
      type = 'snickerdoodle%20'
    }
    else if (this.state.recipe== gingerbread) {
      type = 'gingerbread%20'
    }
    else if (this.state.recipe== shortbread) {
      type = 'shortbread'
    }
    else {
      type = ''
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
    .then(response=>{

    })
  }
}

export default Recipe;
