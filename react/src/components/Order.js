import React, {Component} from 'react';

class Order extends Component {
  constructor(props){
    super(props);

  }

  render(){
    let order = <a href={`orders/${this.props.order.id}`}>{this.props.order.cookie_amount} {this.props.order.cookie_type}</a>;
    
    let distance = <span>{this.props.order.distance}</span>

    return(
      <div>
        {order} Distance: {distance}
      </div>
    );
  }
}

export default Order;
