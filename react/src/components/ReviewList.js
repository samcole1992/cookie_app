import React, {Component} from 'react';
import Review from './Review';

class ReviewList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      currentUser: null,
      reviews: [],
    };

    // this.handleVote = this.handleVote.bind(this);
    // this.handleDelete = this.handleDelete.bind(this);
  }

  // handleVote(type, review) {
  //   let data = {
  //     review_id: review.id,
  //   };
  //   let jsonStringData = JSON.stringify(data);
  //   fetch(`/api/v1/bars/${this.state.barId}/reviews/${review.id}/${type}`, {
  //     credentials: 'same-origin',
  //     method: 'post',
  //     headers: { 'Content-Type': 'application/json' },
  //     body: jsonStringData
  //   })
  //     .then(response => {
  //       if (response.ok) {
  //         return response;
  //       } else {
  //         let errorMessage = `${response.status} (${response.statusText})`,
  //         error = new Error(errorMessage);
  //         throw(error);
  //       }
  //     })
  //     .then(response => {
  //       fetch(`/api/v1/bars/${this.state.barId}`, {
  //         credentials: 'same-origin'
  //       })
  //         .then(response => {
  //           if (response.ok) {
  //             return response;
  //           } else {
  //             let errorMessage = `${response.status}, (${response.statusText})`;
  //             let error = new Error(errorMessage);
  //             throw(error);
  //           }
  //         })
  //         .then(response => response.json())
  //         .then(body => {
  //           let newReviews = body.reviews;
  //           let newUsers = body.users;
  //           this.setState({
  //             reviews: newReviews,
  //             users: newUsers,
  //           });
  //         });
  //     })
  //     .catch(error => console.error(`Error in fetch: ${error.message}`));
  // }
  //
  // handleDelete(reviewId) {
  //   fetch(`/api/v1/bars/${this.state.barId}/reviews/${reviewId}`, {
  //     method: 'delete',
  //     credentials: 'same-origin'
  //   })
  //   .then(response => {
  //     if (response.ok) {
  //       return response;
  //     } else {
  //       let errorMessage = `${response.status}, (${response.statusText})`;
  //       let error = new Error(errorMessage);
  //       throw(error);
  //     }
  //   })
  //   .then(response => {
  //     fetch(`/api/v1/bars/${this.state.barId}`,{
  //       credentials: 'same-origin'
  //     })
  //       .then(response => {
  //         if (response.ok) {
  //           return response;
  //         } else {
  //           let errorMessage = `${response.status}, (${response.statusText})`;
  //           let error = new Error(errorMessage);
  //           throw(error);
  //         }
  //       })
  //       .then(response => response.json())
  //       .then(body => {
  //         let newReviews = body.reviews;
  //         let newUsers = body.users;
  //         this.setState({
  //           reviews: newReviews,
  //           users: newUsers,
  //         });
  //       });
  //   })
  //   .catch(error => console.error(`Error in fetch: ${error.message}`));
  //   }

    componentDidMount() {
      let url = window.location.href.split("/");
      let newBakerId = url[url.length - 9];

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
         response.forEach(function(review){
           newReviews.push(review);
         });
        this.setState({
          // currentUser: newCurrentUser,
          reviews: newReviews,
        });
      });
    }

    render() {
      // let counter = -1;
      let reviews;
      if (this.state.reviews) {
        reviews = this.state.reviews.map((review) => {
          // counter ++;

          // let handleUpvote = () => {
          //   return(
          //     this.handleVote('up_vote', review)
          //   );
          // };
          // let handleDownvote = () => {
          //   return(
          //     this.handleVote('down_vote', review)
          //   );
          // };
          //
          // let handleDeleteReview = () => {
          //   return(
          //     this.handleDelete(review.id)
          //   );
          // };

          // let handleDelete = this.handleDelete;

          return(
            <Review
              key = {review.id}
              id = {review.id}
              rating = {review.rating}
              body = {review.body}
              // score = {review.score}
              // user_id = {review.user_id}
              // handleUpvote = {handleUpvote}
              // handleDownvote = {handleDownvote}
              // handleDelete = {handleDeleteReview}
              // currentUser = {this.state.currentUser}
              consumerId = {review.consumer_id}
              providerId = {review.provider_id}
            />
          );
        });
      }
      // reviews = reviews.sort(function(a,b) {
      //   return b.key - a.key;
      // });
      return(
        <div id="username">
          {reviews}
        </div>
      );
    }
}

export default ReviewList;
