import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import ReviewList from './components/ReviewList';
import OrderList from './components/OrderList';


$(function() {
  if (document.getElementById('OrderList')){
    ReactDOM.render(
      <OrderList />,
      document.getElementById('OrderList')
    );
  } else {
    if (document.getElementById('ReviewList')){
      ReactDOM.render(
        <ReviewList />,
        document.getElementById('ReviewList')
      );
    }
  }
});
