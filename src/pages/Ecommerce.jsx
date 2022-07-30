import React, { useState, useEffect } from "react";
import { DropDownListComponent } from "@syncfusion/ej2-react-dropdowns";
import http from "../http";
import { useStateContext } from "../contexts/ContextProvider";
import {
  dropdownData,
} from "../data/dummy";
import { FiBarChart } from "react-icons/fi";
import { BsBoxSeam } from "react-icons/bs";
import Bar from "../components/Bar";

const DropDown = ({ currentMode }) => (
  <div className="w-28 border-1 border-color px-2 py-1 rounded-md">
    <DropDownListComponent
      id="time"
      fields={{ text: "Time", value: "Id" }}
      style={{ border: "none", color: currentMode === "Dark" && "white" }}
      value="1"
      dataSource={dropdownData}
      popupHeight="220px"
      popupWidth="120px"
    />
  </div>
);

const Ecommerce = () => {
  const { currentColor, currentMode } = useStateContext();

  const [data, setData] = useState({
    dailyDone: 0,
    dailyNotdone: 0,
    dailyOrders: 0,
    monthlySales: 0,
  });

  useEffect(() => {
    const fetch = async () => {
      const dataFetch = await http.get("/dailysalesDone");
      const total = new Intl.NumberFormat("vi-VN", {
        style: "currency",
        currency: "VND",
      }).format(dataFetch.data[0].total);
      setData((prev) => ({ ...prev, dailyDone: total }));
    };
    fetch();
  }, []);

  useEffect(() => {
    const fetch = async () => {
      const dataFetch = await http.get("/dailysalesNot");
      const total = new Intl.NumberFormat("vi-VN", {
        style: "currency",
        currency: "VND",
      }).format(dataFetch.data[0].total);
      setData((prev) => ({ ...prev, dailyNotdone: total }));
    };
    fetch();
  }, []);

  useEffect(() => {
    const fetch = async () => {
      const dataFetch = await http.get("/dailyorders");
      setData((prev) => ({ ...prev, dailyOrders: dataFetch.data[0].orders }));
    };
    fetch();
  }, []);

  useEffect(() => {
    const fetch = async () => {
      const dataFetch = await http.get("/monthlySales");
      const total = new Intl.NumberFormat("vi-VN", {
        style: "currency",
        currency: "VND",
      }).format(dataFetch.data[0].total);
      setData((prev) => ({ ...prev, monthlySales: total }));
    };
    fetch();
  }, []);

  return (
    <div className="mt-24">
      <div className="flex flex-wrap lg:flex-nowrap justify-center ">
        <div className="flex m-3 flex-wrap justify-center gap-1 items-center">
          <div className="bg-white h-50 dark:text-gray-200 dark:bg-secondary-dark-bg md:w-56  p-4 pt-9 rounded-2xl ">
            <button
              type="button"
              style={{
                color: "rgb(228, 106, 118)",
                backgroundColor: "#E5FAFB",
                marginRight: "5px",
              }}
              className="text-2xl opacity-0.9 rounded-full  p-4 hover:drop-shadow-xl"
            >
              <FiBarChart />
            </button>
            Daily Sales
            <p className="mt-3">
              <span className="text-lg font-semibold">{data.dailyDone}</span>
              <span className={`text-sm ml-2`}></span>
            </p>
            <p className="text-sm text-gray-400  mt-1"> Đã thanh toán</p>
          </div>
          <div className="bg-white h-50 dark:text-gray-200 dark:bg-secondary-dark-bg md:w-56  p-4 pt-9 rounded-2xl ">
            <button
              type="button"
              style={{
                color: "rgb(228, 106, 118)",
                backgroundColor: "rgb(255, 244, 229)",
                marginRight: "5px",
              }}
              className="text-2xl opacity-0.9 rounded-full  p-4 hover:drop-shadow-xl"
            >
              <FiBarChart />
            </button>
            Daily Sales
            <p className="mt-3">
              <span className="text-lg font-semibold">{data.dailyNotdone}</span>
              <span className={`text-sm ml-2`}></span>
            </p>
            <p className="text-sm text-gray-400  mt-1"> Chưa thanh toán</p>
          </div>

          <div className="bg-white h-50 dark:text-gray-200 dark:bg-secondary-dark-bg md:w-56  p-4 pt-9 rounded-2xl ">
            <button
              type="button"
              style={{
                color: "rgb(255, 244, 229)",
                backgroundColor: "rgb(254, 201, 15)",
                marginRight: "5px",
              }}
              className="text-2xl opacity-0.9 rounded-full  p-4 hover:drop-shadow-xl"
            >
              <BsBoxSeam />
            </button>
            Daily Orders
            <p className="mt-3">
              <span className="text-lg font-semibold">{data.dailyOrders}</span>
              <span className={`text-sm ml-2`}></span>
            </p>
            <p className="text-sm text-gray-400  mt-1">Đơn hàng</p>
          </div>

          <div className="bg-white h-50 dark:text-gray-200 dark:bg-secondary-dark-bg md:w-56  p-4 pt-9 rounded-2xl ">
            <button
              type="button"
              style={{
                color: "rgb(255, 244, 229)",
                backgroundColor: "#FF5733",
                marginRight: "5px",
              }}
              className="text-2xl opacity-0.9 rounded-full  p-4 hover:drop-shadow-xl"
            >
              <FiBarChart />
            </button>
            Monthly Sales
            <p className="mt-3">
              <span className="text-lg font-semibold">{data.monthlySales}</span>
              <span className={`text-sm ml-2`}></span>
            </p>
            <p className="text-sm text-gray-400  mt-1">Đã thanh toán</p>
          </div>
        </div>
      </div>
      <Bar/>

      
    </div>
  );
};

export default Ecommerce;
