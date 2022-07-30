import React, { useState } from "react";
import http from "../http";

function AddOrder() {
    const [order, setOrder] = useState({
    });
    const handleChange = (e, name) => {
        setOrder(prev => ({
            ...prev, 
            [name]:e
        }))

    }
    console.log(order);
    const handleSubmit = async() => {
        const res = http.post('/addorder', order);
    }

  return (
    <div className="m-2 md:m-10 mt-24 p-2 md:p-10 bg-white rounded-3xl">
      <div>
        <h1 style={{ fontSize: "30px", fontWeight: "700" }}>
          New Order
        </h1>
        <form>
          <div className="mb-6">
            <label
              htmlFor="name"
              className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >
              User ID
            </label>
            <input
              type="text"
              id="name"
              name="use_id"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
              required=""
              onChange={(e) => handleChange(e.target.value, "user_id")}
            />
          </div>
          <div className="mb-6">
            <label
              htmlFor="desciption"
              className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >
              Product ID
            </label>
            <input
              type="text"
              id="desciption"
              name="product_id"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
              required=""
              onChange={(e) => handleChange(e.target.value, "product_id")}
            />
          </div>
          
          
          

          

         

          

          <button
            onClick={handleSubmit}
            type="submit"
            className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
          >
            Add
          </button>
        </form>
      </div>
    </div>
  );
}

export default AddOrder;
