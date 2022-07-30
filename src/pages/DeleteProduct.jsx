import React, { useState } from "react";
import http from "../http";

function DeleteProduct({type}) {
  const [product, setProduct] = useState();

  const handleChange = (e) => {
    setProduct(e);
  };

  const handleSubmit = () => {
    const fetch = async () => {
      const res = await http.delete(`/delete${type}/${product}`);
    };
    fetch();
  };
  return (
    <div className="m-2 md:m-10 mt-24 p-2 md:p-10 bg-white rounded-3xl">
      <div>
        <form>
          <div className="mb-6">
            <label
              htmlFor="name"
              className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >
              Product ID
            </label>
            <input
              type="text"
              id="name"
              name="id"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
              required=""
              onChange={(e) => handleChange(e.target.value)}
            />
          </div>

          <button
            onClick={handleSubmit}
            type="submit"
            className="text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800"
          >
            Delete
          </button>
        </form>
      </div>
    </div>
  );
}

export default DeleteProduct;
