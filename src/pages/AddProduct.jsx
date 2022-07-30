import React, { useState } from "react";
import http from "../http";

function AddProduct({type}) {

  const [product, setProduct] = useState({
    ten:"",
    mota:"",
    gia:'',
    hansudung:"",
    tenthuonghieu:"",
    inventory_id: '',
    anh:"",
    loaisp:"",
  })


  const handleChange = (e, name) => {
    setProduct(prev => ({
      ...prev, 
      [name] : e
    }))

  }

  const handleSubmit =() => {
    const fetch = async () => {
      const res = await http.post(`/add${type}`, product);
    }
    fetch()
  }
  return (
    <div className="m-2 md:m-10 mt-24 p-2 md:p-10 bg-white rounded-3xl">
      <div>
        <h1 style={{ fontSize: "30px", fontWeight: "700" }}>
          New Skincare Product
        </h1>
        <form>
          <div className="mb-6">
            <label
              htmlFor="name"
              className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >
              Tên sản phẩm
            </label>
            <input
              type="text"
              id="name"
              name="ten"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
              required=""
              onChange={(e) => handleChange(e.target.value, 'ten')}
            />
          </div>
          <div className="mb-6">
            <label
              htmlFor="desciption"
              className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >
              Mô tả
            </label>
            <input
              type="text"
              id="desciption"
              name="mota"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
              required=""
              onChange={(e) => handleChange(e.target.value, 'mota')}
            />
          </div>
          <div className="mb-6">
            <label
              htmlFor="brand"
              
              className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >
              Tên thương hiệu
            </label>
            <input
              type="text"
              id="brand"
              name='tenthuonghieu'
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
              required=""
              onChange={(e) => handleChange(e.target.value, 'tenthuonghieu')}
            />
          </div>
          <div className="mb-6">
            <label
              htmlFor="price"
              className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >
              Giá
            </label>
            <input
              type="text"
              id="price"
              name="gia"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
              required=""
              onChange={(e) => handleChange(e.target.value, 'gia')}
            />
          </div>
          <div className="mb-6">
            <label
              htmlFor="image"
              className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >
              Ảnh
            </label>
            <input
              type="file"
              id="image"
              name="anh"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
              required=""
              onChange={(e) => handleChange(e.target.value, 'anh')}
            />
          </div>

          <div className="mb-6">
            <label
              htmlFor="type"
              className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >
              Loại sản phẩm
            </label>
            <input
              type="text"
              id="type"
              name="loaisanpham"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
              required=""
              onChange={(e) => handleChange(e.target.value, 'loaisp')}
            />
          </div>

          <div className="mb-6">
            <label
              htmlFor="hsd"
              className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >
              Hạn sử dụng
            </label>
            <input
              type="date"
              id="hsd"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
              required=""
              onChange={(e) => handleChange(e.target.value, 'hansudung')}
            />
          </div>

          <div className="mb-6">
            <label
              htmlFor="hsd"
              className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
            >
              Inventory ID
            </label>
            <input
              type="text"
              id="hsd"
              className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
              required=""
              onChange={(e) => handleChange(e.target.value, 'inventory_id')}
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

export default AddProduct;
