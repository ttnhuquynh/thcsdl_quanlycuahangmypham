const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const morgan = require("morgan");
const app = express();
app.use(morgan("combined"));
app.use(express.json());
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
require("dotenv").config();

//mysql connect
const connection = require("./config/db.config");

// ----------------------------------------sql queries-------------------------------------------

// ------------product--------------
//add product
app.post("/addproduct", (req, res) => {
  let data = [req.body, req.body.name];
  let sql = "INSERT INTO products SET ? ";
  connection.query(sql, data, (error, result) => {
    if (error) res.json("fail");
    res.json("success");
  });
});

// get a product
app.get("/product/:id", (req, res) => {
  let sql = "select * from products where product_id = ?";
  connection.query(sql, req.params.id, (error, result) => {
    if (error) res.json("fail");
    res.json(result);
  });
});

//delete product
app.delete("/deleteproduct/:id", (req, res) => {
  let sql = "DELETE FROM products WHERE products.product_id = ? ";
  connection.query(sql, req.params.id, (error, result) => {
    if (error) throw error;
    res.send("delete product successfully");
  });
});
app.delete("/deletemakeup/:id", (req, res) => {
  let sql = "DELETE FROM makeup WHERE makeup.product_id = ? ";
  connection.query(sql, req.params.id, (error, result) => {
    if (error) throw error;
    res.send("delete product successfully");
  });
});

// find product by id
app.get("/product/:id", (req, res) => {
  let sql = "SELECT * FROM products WHERE product_id = ?";
  connection.query(sql, req.params.id, (error, result) => {
    if (error) {
      res.json("Sytax fail");
    }
    res.json(result);
  });
});

// percentage of skincare product
app.get("/skincarepercen", (req, res) => {
  let sql =
    "SELECT (select number from inventories WHERE type = '0')/(select sum(number) from inventories)*100 percent";
  connection.query(sql, (error, result) => {
    if (error) res.json("fail");
    res.json(result[0].percent);
  });
});

//edit product
app.post("/editproduct/:id", (req, res) => {
  let data = [req.body, req.params.id];
  let sql = "UPDATE products SET ? WHERE product_id = ?";
  connection.query(sql, data, (error, result) => {
    if (error) res.json("fail");
    res.json("success");
  });
});
//product skincare
app.get("/skincare", (req, res) => {
  let sql = "SELECT * FROM products where type = '0'";
  connection.query(sql, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//product makeup
app.get("/makeup", (req, res) => {
  let sql = "SELECT * FROM products where type= '1'";
  connection.query(sql, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//  sold out product
app.get("/skincaresoldout", (req, res) => {
  let sql = "SELECT * FROM products where type = '0' and number = '0'";
  connection.query(sql, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});
app.get("/makeupsoldout", (req, res) => {
  let sql = "SELECT * FROM products where type = '1' and number = '0'";
  connection.query(sql, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//top product
app.get("/topproduct", (req, res) => {
  let sql =
    "select image,price, name, category, max(quantity) as max, products.number  from products inner join \
  (select product_id, sum(number) as quantity from orders group by product_id limit 50) orders_sum \
  on products.product_id = orders_sum.product_id \
  group by category";
  connection.query(sql, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//find product
app.post("/findskincare", (req, res) => {
  const name = `%${req.body.name}%`;
  console.log(req.body);
  let sqlUsers = "SELECT * FROM products where name LIKE ? AND type ='0'";
  connection.query(sqlUsers, name, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

app.post("/findmakeup", (req, res) => {
  const name = `%${req.body.name}%`;
  console.log(req.body);
  let sqlUsers = "SELECT * FROM products where name LIKE ? AND type ='1'";
  connection.query(sqlUsers, name, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//-------------------orders-----------------
//add orders
app.post("/addorder", (req, res) => {
  let order = [req.body];
  let sqlUser =
    "SELECT EXISTS(SELECT user_id FROM users where user_id = ?) user";
  connection.query(sqlUser, req.body.user_id, (error, result) => {
    if (error) res.json("error");
    if (result[0].user == 0) res.json("no user");
  });
  let sqlProduct =
    "SELECT EXISTS(SELECT product_id FROM products where product_id = ?) product";
  connection.query(sqlProduct, req.body.product_id, (error, result) => {
    if (error) res.json("error");
    if (result[0].product == 0) res.json("no product");
  });
  let sqlNumber = "SELECT number FROM products WHERE product_id = ? ";
  connection.query(sqlNumber, req.body.product_id, (error, result) => {
    if (error) res.json("error");
    if (parseInt(result[0].number) < parseInt(req.body.number))
      res.json("no number");
  });
  let sql = "INSERT INTO orders SET ?";
  connection.query(sql, order, (error, result) => {
    if (error) res.json("error");
    res.json("success");
  });

}
);

//all orders
app.get("/orders", (req, res) => {
  let sql = "SELECT * FROM orders ";
  connection.query(sql, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

// get number of orders by user_id
app.get("/numberorders/:id", (req, res) => {
  let sql = "SELECT count(order_id) as count FROM orders where user_id = ?";
  connection.query(sql, req.params.id, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//get infor of orders by user_id
app.get("/ordersofuser/:id", (req, res) => {
  let sql =
    "SELECT orders.order_id, user_id, product_id, number, total, status FROM orders, payments where orders.order_id = payments.order_id and orders.user_id = ?";
  connection.query(sql, req.params.id, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//get total of a use by use_id
app.get("/bought/:id", (req, res) => {
  let sql =
    "SELECT sum(total) as sum FROM payments, orders WHERE status = '0' AND user_id = ? ";
  connection.query(sql, req.params.id, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//all users
app.get("/users", (req, res) => {
  let sqlUsers = "SELECT * FROM users";
  connection.query(sqlUsers, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//daily orders
app.get("/orders/amount/today", (req, res) => {
  let today = new Date();
  today =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
  let sql =
    "SELECT count(order_id) as soluongdon FROM orders WHERE date(created_at) = ?";
  connection.query(sql, today, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

// daily sales
app.get("/paymentstoday", (req, res) => {
  let today = new Date();
  today =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();

  let sql =
    "SELECT sum(total) as total FROM payments WHERE date(created_at) = ?";
  connection.query(sql, today, (error, result) => {
    if (error) throw error;
    if (result.total == null) {
      res.json(result);
    } else res.json([{ total: 0 }]);
  });
});

//yesterday sales
app.get("/paymentsyesterday", (req, res) => {
  let yesterday = new Date();
  yesterday.setDate(yesterday.getDate() - 1);
  yesterday =
    yesterday.getFullYear() +
    "-" +
    (yesterday.getMonth() + 1) +
    "-" +
    yesterday.getDate();

  let sql =
    "SELECT sum(total) as total FROM payments WHERE date(created_at) = ?";
  connection.query(sql, yesterday, (error, result) => {
    if (error) throw error;
    if (result.total == null) res.json(result);
    else res.json([{ total: 0 }]);
  });
});

//three days ago sales
app.get("/paymentsthreedayago", (req, res) => {
  let yesterday = new Date();
  yesterday.setDate(yesterday.getDate() - 2);
  yesterday =
    yesterday.getFullYear() +
    "-" +
    (yesterday.getMonth() + 1) +
    "-" +
    yesterday.getDate();

  let sql =
    "SELECT sum(total) as total FROM payments WHERE date(created_at) = ?";
  connection.query(sql, yesterday, (error, result) => {
    if (error) throw error;
    if (result.total == null) res.json(result);
    else res.json([{ total: 0 }]);
  });
});

//daily orders
app.get("/orderstoday", (req, res) => {
  let today = new Date();
  today =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();

  let sql =
    "SELECT count(order_id) as total FROM orders WHERE date(created_at) = ?";
  connection.query(sql, today, (error, result) => {
    if (error) throw error;
    if (result.total == null) {
      res.json(result);
    } else res.json([{ total: 0 }]);
  });
});

// yesterday orders
app.get("/ordersyesterday", (req, res) => {
  let yesterday = new Date();
  yesterday.setDate(yesterday.getDate() - 1);
  yesterday =
    yesterday.getFullYear() +
    "-" +
    (yesterday.getMonth() + 1) +
    "-" +
    yesterday.getDate();

  let sql =
    "SELECT count(order_id) as total FROM orders WHERE date(created_at) = ?";
  connection.query(sql, yesterday, (error, result) => {
    if (error) throw error;
    if (result.total == null) res.json(result);
    else res.json([{ total: 0 }]);
  });
});

//three days ago orders
app.get("/ordersthreedayago", (req, res) => {
  let yesterday = new Date();
  yesterday.setDate(yesterday.getDate() - 2);
  yesterday =
    yesterday.getFullYear() +
    "-" +
    (yesterday.getMonth() + 1) +
    "-" +
    yesterday.getDate();
  let sql =
    "SELECT count(order_id) as total FROM orders WHERE date(created_at) = ?";
  connection.query(sql, yesterday, (error, result) => {
    if (error) throw error;
    if (result.total == null) res.json(result);
    else res.json([{ total: 0 }]);
  });
});

//total
app.get("/orders", (req, res) => {
  let sql = "SELECT sum(total) as total FROM orders";
  connection.query(sql, (error, result) => {
    if (error) throw error;
    if (result.total == null) res.json(result);
    else res.json({ total: 0 });
  });
});

//daily sale (đã thanh toán)
app.get("/dailysalesDone", (req, res) => {
  let today = new Date();
  today =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
  let sql =
    "SELECT sum(total) as total FROM payments where status='1' AND date(created_at) = ?";
  connection.query(sql, today, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//daily sales (chưa thanh toán)
app.get("/dailysalesNot", (req, res) => {
  let today = new Date();
  today =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
  let sql =
    "SELECT sum(total) as total FROM payments where status='0' AND date(created_at) = ? ";
  connection.query(sql, today, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//daily order
app.get("/dailyorders", (req, res) => {
  let today = new Date();
  today =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
  let sql =
    "SELECT count(order_id) as orders FROM orders where date(created_at) = ?";
  connection.query(sql, today, (error, result) => {
    if (error) throw error;
    res.json(result);
  });
});

//monthly sales
app.get("/monthlySales", (req, res) => {
  let date = new Date();
  date.setDate(date.getDate() - 30);
  date =
    date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
  let sql =
    "SELECT sum(total) as total FROM payments WHERE status= '1' and date(created_at) >= ?";
  connection.query(sql, date, (error, result) => {
    if (error) throw error;
    if (result.total == null) res.json(result);
    else res.json({ total: 0 });
  });
});

app.listen(process.env.PORT, function () {
  console.log(`Node server running @ http://localhost:${process.env.PORT}`);
});
