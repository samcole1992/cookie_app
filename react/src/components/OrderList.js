import React from 'react';
import Order from './Order';

class OrderList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
       orders: []
     };
    this.getOrders = this.getOrders.bind(this);
  }

  componentDidMount(){
    this.getOrders();
    setInterval(this.getOrders, 87000);
  }

  getOrders() {
    fetch('api/v1/orders',{
      credentials: "same-origin"
    }).then(response => {
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
      let newOrders = [];
      response.forEach(function(order){
        newOrders.push(order);
      });
      newOrders;
      this.setState({
        orders: newOrders
      });
    });
  }

  filterOrders(){
    let newOrders = this.state.orders.forEach(function(item, index,order){
      if (order.distance==0) {
        order.splice(index, 1)
      };
      if (order.fulfilled==false) {
        order.splice(index, 1)
      };
    })
    newOrders;
    this.setState({
      orders:newOrders
    })
  }

  deleteOrders(){
    let newOrders = this.state.orders.sort(function(a, b){
      return parseFloat(a.distance)- parseFloat(b.distance);
    });
    newOrders;
    this.setState({
      orders:newOrders
    })
  }

  render(){

    let orders = this.state.orders.map((order)=>{
      return(

        <Order
          order = {order}
          key = {order.id}
          id = {order.id}
          payment = {order.payment}
          allergies = {order.allergies}
          cookie_type = {order.cookie_type}
          cookie_amount = {order.cookie_amount}
          distance = {order.distance}
        />
      );
    });


    return(
      <div>

        {orders}
      </div>
    );
  }
}

export default OrderList;
