import React, {Component} from 'react';
import Review from './Review';

class ReviewList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentUser: null,
      reviews: []
    };
}
componentDidMount(){
  this.getReviews();
  setInterval(this.getOrders, 15000);
}

      getReviews() {
        let url = window.location.href.split("/");
        let newBakerId = url[url.length - 1];
      fetch(`/api/v1/users/${newBakerId}/reviews`, {
        credentials: 'same-origin'
      })
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status}, (${response.statusText})`;
          let error = new Error(errorMessage);
          throw(error);
        }
      })

      .then(response => response.json())

      .then(response => {

        let newReviews =[];
        let url = window.location.href.split("/");
        let newBakerId = url[url.length - 1];

         response.forEach(function(review){
           if (review.provider_id ==newBakerId) {
               newReviews.push(review);
             }
             })
             newReviews;
            this.setState({
              reviews: newReviews
            });
          });
    }



    render() {

      let reviews;
      if (this.state.reviews) {
        reviews = this.state.reviews.map((review) => {
          return(
            <Review
              key = {review.id}
              id = {review.id}
              rating = {review.rating}
              body = {review.body}
              consumerId = {review.consumer_id}
              providerId = {review.provider_id}
            />
          );
        });
      }


      return(

        <div>
          {reviews}
        </div>
      );
    }
}

export default ReviewList;
