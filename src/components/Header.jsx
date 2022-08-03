import React from "react";
import { Link } from "react-router-dom";

const Header = ({ category, title }) => (
  <>
    <div className="mb-10">
      <p className="text-lg text-gray-400">{category}</p>
      <p className="text-3xl font-extrabold tracking-tight text-slate-900">
        {title}
      </p>
    </div>
    {category == "Orders" || title == "Users"  || category == "Sold out"  || title == "Top Product by Category" ? (
      <></>
    ) : (
      <>
        <Link to={"/add" + title.toLowerCase()}>
          <button
            type="button"
            className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
          >
            Add new
          </button>
        </Link>
        <Link to={"/deleteproduct"}>
          <button
            type="button"
            className="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900"
          >
            Delete
          </button>
        </Link>
      </>
    )}
    
  </>
);

export default Header;
