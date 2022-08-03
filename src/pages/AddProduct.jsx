import React, { useState } from "react";
import http from "../http";
import "react-toastify/dist/ReactToastify.css";
import { toast } from "react-toastify";
import { useNavigate } from "react-router-dom";

function AddProduct({ type }) {
  const navigate = useNavigate();
  const [nofication, setNofication] = useState(false);
  const [product, setProduct] = useState({
    name: "",
    description: "",
    price: "",
    expiry_date: "",
    brand: "",
    number: 0,
    image: "",
    category: "",
    type,
  });

  const page = type == "0" ? "skincare" : "makeup";

  const handleChange = (e, name) => {
    if (name == "number" && e < 0) {
      setNofication(true);
    } else {
      setNofication(false);
    }
    setProduct((prev) => ({
      ...prev,
      [name]: e,
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (product.number <= 0) {
      setNofication(true);
      return 0;
    }
    const res = await http.post(`/addproduct`, product);
    if (res.data == "fail") {
      toast.error("Adding new product failed. \nPlease check again");
    } else if (res.data == "success") {
      toast.success("Adding new product successfully");
      navigate(`/${page}`);
    }
  };

  return (
    <>
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
                required
                onChange={(e) => handleChange(e.target.value, "name")}
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
                required
                onChange={(e) => handleChange(e.target.value, "description")}
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
                name="tenthuonghieu"
                className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                required
                onChange={(e) => handleChange(e.target.value, "brand")}
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
                min="0"
                className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                required
                onChange={(e) => handleChange(e.target.value, "price")}
              />
            </div>
            <div className="mb-6">
              <label
                htmlFor="image"
                className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
              >
                Ảnh (URL)
              </label>
              <input
                type="text"
                id="image"
                name="anh"
                className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                required
                onChange={(e) => handleChange(e.target.value, "image")}
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
                required
                onChange={(e) => handleChange(e.target.value, "category")}
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
                required
                onChange={(e) => handleChange(e.target.value, "expiry_date")}
              />
            </div>

            <div className="mb-6">
              <label
                htmlFor="hsd"
                className="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
              >
                Số lượng
              </label>
              <input
                type="number"
                id="hsd"
                min="1"
                className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                required
                onChange={(e) => handleChange(e.target.value, "number")}
              />

              {nofication && (
                <span style={{ color: "red", fontSize: "12px" }}>
                  Số lượng sản phẩm phải lớn hơn 0
                </span>
              )}
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
    </>
  );
}

export default AddProduct;
