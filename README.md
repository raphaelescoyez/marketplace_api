
# Barebone Marketplace API

Note : This is a code sample written in one day for Shopify in order to show some of my coding skills.

This application is deployed on Heroku and can be tested easily thanks to GraphiQL.
 [Test API online](https://marketplace-api-demo.herokuapp.com/) 

## Local Installation

### Prerequisite
- Ruby 2.5.0
- Rails 5.2
- Postgresql

 1. Clone this repo
 2. Run `bundle install`
 3. Run `rails db:create && rails db:migrate && rails db:seed`
 4. Run `rails server`
 5. The GraphiQL interface is now available at `http://localhost:3000`

## Database Schema
![Schema description](https://github.com/raphaelescoyez/marketplace_api/blob/master/public/marketplace_api.png?raw=true)

Carts and Orders have very similar logic, the only difference is that Cart model is flexible to product price changes, Order has its own price attributes.

## How to use

Use the following queries to complete an order.
For more queries, follow the generated documentation on [GraphiQL](https://marketplace-api-demo.herokuapp.com/) right pannel.

### 1) Display all products
```
query {
  products(availableOnly: false) {
  id
    title
    description
    price
    inventoryCount
  }
}
```
`availableOnly` argument is optional

### 2) Add product to your cart
Note : `cartId` is optional, if you don't have a cart yet, it will create one for you.
```
mutation {
  addToCart(input:
    {
      productId: [selected_product_id]
      cartId: [your_cart_id]
    }
  )
  {
    errors
    cart {
      id
      totalPrice
    }
  }
}
```

### 3) Add more products or remove some of them
```
mutation {
  removeFromCart(input:
    {
      productId: [selected_product_id]
      cartId: [your_cart_id]
    }
  )
  {
    errors
    cart {
      id
      totalPrice
      cartsProducts {
        quantity
        product {
          id
          title
        }
      }
    }
  }
}
```

### 4) Display cart
```
query {
  cart(id: [your_cart_id]) {
    id
  totalPrice
  cartsProducts {
      quantity
      product {
        title
      }
    }
  }
}
```

### 5) Place order
```
mutation {
  placeOrder(input:
    {
    cartId: [your_cart_id],
    email: "email@example.com"
    }
  )
  {
    errors
    order {
      id
      totalPrice
      ordersProducts {
        product {
          title
        }
      }
    }
  }
}
```

### 6) Read your order again
```
query {
  order(id: [your_order_id]){
    id
    totalPrice
    ordersProducts {
      quantity
      productPrice
      product {
      	title
      }
    }
  }
}
```
