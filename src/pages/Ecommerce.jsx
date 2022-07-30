import React, { useState, useEffect } from "react";
import { BsCurrencyDollar } from "react-icons/bs";
import { GoPrimitiveDot } from "react-icons/go";
import { IoIosMore } from "react-icons/io";
import { DropDownListComponent } from "@syncfusion/ej2-react-dropdowns";
import { Stacked, Pie, Button, LineChart, SparkLine } from "../components";
import http from "../http";

import { ChartComponent, SeriesCollectionDirective, SeriesDirective, Inject, Legend, Category, Tooltip, ColumnSeries, DataLabel } from '@syncfusion/ej2-react-charts';

import { barCustomSeries, barPrimaryXAxis, barPrimaryYAxis } from '../data/dummy';
import { ChartsHeader } from '../components';
import { useStateContext } from '../contexts/ContextProvider';
import {
  earningData,
  medicalproBranding,
  recentTransactions,
  weeklyStats,
  dropdownData,
  SparklineAreaData,
  ecomPieChartData,
} from "../data/dummy";
import product9 from "../data/product9.jpg";
import { FiBarChart } from "react-icons/fi";
import {BsBoxSeam} from 'react-icons/bs'

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
      setData((prev) => ({ ...prev, dailyDone: dataFetch.data[0].doanhthu }));
    };
    fetch();
  }, []);

  useEffect(() => {
    const fetch = async () => {
      const dataFetch = await http.get("/dailysalesNot");
      setData((prev) => ({ ...prev, dailyNotdone: dataFetch.data[0].doanhthu }));
    };
    fetch();
  }, []);

  useEffect(() => {
    const fetch = async () => {
      const dataFetch = await http.get("/dailyorders");
      setData((prev) => ({ ...prev, dailyOrders: dataFetch.data[0].sodon }));
    };
    fetch();
  }, []);

  useEffect(() => {
    const fetch = async () => {
      const dataFetch = await http.get("/monthlySales");
      setData((prev) => ({ ...prev, monthlySales: dataFetch.data[0].doanhthu }));
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
              {/* {item.icon} */}
              <FiBarChart />
            </button>
            Daily Sales
            <p className="mt-3">
              <span className="text-lg font-semibold">{data.dailyDone}đ</span>
              <span className={`text-sm ml-2`}>
                {/* {item.percentage} */} 
              </span>
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
              {/* {item.icon} */}
              <FiBarChart />
            </button>
            Daily Sales
            <p className="mt-3">
              <span className="text-lg font-semibold">{data.dailyNotdone}đ</span>
              <span className={`text-sm ml-2`}>
                {/* {item.percentage} */} 
              </span>
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
              {/* {item.icon} */}
              <BsBoxSeam />
            </button>
            Daily Orders
            <p className="mt-3">
              <span className="text-lg font-semibold">{data.dailyOrders}</span>
              <span className={`text-sm ml-2`}>
                {/* {item.percentage} */} 
              </span>
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
              {/* {item.icon} */}
              <FiBarChart />
            </button>
            Monthly Sales
            <p className="mt-3">
              <span className="text-lg font-semibold">{data.monthlySales}đ</span>
              <span className={`text-sm ml-2`}>
                {/* {item.percentage} */} 
              </span>
            </p>
            <p className="text-sm text-gray-400  mt-1">Đã thanh toán</p>
          </div>
          
        </div>
      </div>

      <div className="m-4 md:m-10 mt-24 p-10 bg-white dark:bg-secondary-dark-bg rounded-3xl">
      <ChartsHeader category="Bar" title="Thống kê $" />
      <div className=" w-full">
        <ChartComponent
          id="charts"
          primaryXAxis={barPrimaryXAxis}
          primaryYAxis={barPrimaryYAxis}
          chartArea={{ border: { width: 0 } }}
          tooltip={{ enable: true }}
          background={currentMode === 'Dark' ? '#33373E' : '#fff'}
          legendSettings={{ background: 'white' }}
        >
          <Inject services={[ColumnSeries, Legend, Tooltip, Category, DataLabel]} />
          <SeriesCollectionDirective>
            {/* eslint-disable-next-line react/jsx-props-no-spreading */}
            {barCustomSeries.map((item, index) => <SeriesDirective key={index} {...item} />)}
          </SeriesCollectionDirective>
        </ChartComponent>
      </div>
    </div>
      
     

     

    
    </div>
  );
};

export default Ecommerce;
