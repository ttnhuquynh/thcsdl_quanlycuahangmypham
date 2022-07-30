import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import http from "../http";
import { Link } from "react-router-dom";

function User() {
  const id = useParams().id;
  const [data, setData] = useState({
    orders: 0,
    buys: 0,
  });

  useEffect(() => {
    const fetch = async () => {
      const res = await http.get(`/numberorders/${id}`);

      setData((prev) => ({
        ...prev,
        orders: res.data[0].count,
      }));
    };
    fetch();
  }, []);

  useEffect(() => {
    const fetch = async () => {
      const res = await http.get(`/bought/${id}`);
      const total = new Intl.NumberFormat("vi-VN", {
        style: "currency",
        currency: "VND",
      }).format(res.data[0].sum);
      setData((prev) => ({
        ...prev,
        buys: total,
      }));
    };
    fetch();
  }, []);

  return (
    <div style={{ display: "flex", marginLeft: '100px'}}>
      <div class="p-6 max-w-sm bg-white rounded-lg border border-gray-200 shadow-md dark:bg-gray-800 dark:border-gray-700" style={{ marginRight: '10px'}}>
        <a href="#">
          <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
            Orders
          </h5>
        </a>
        <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">
          {data.orders}
        </p>
        
        <a href="#">
          <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
            Total
          </h5>
        </a>
        <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">
          {data.buys}
        </p>
        <a
          href={"/ordersofuser/" + id}
          class="inline-flex items-center py-2 px-3 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
        >
          Chi tiết
          <svg
            aria-hidden="true"
            class="ml-2 -mr-1 w-4 h-4"
            fill="currentColor"
            viewBox="0 0 20 20"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              fill-rule="evenodd"
              d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z"
              clip-rule="evenodd"
            ></path>
          </svg>
        </a>
      </div>

      
    </div>
  );
}

export default User;
