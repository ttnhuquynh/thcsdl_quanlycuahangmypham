import React, { useState, useEffect } from "react";
import http from "../http";
import { FiBarChart } from "react-icons/fi";
import { BsBoxSeam } from "react-icons/bs";
import Bar from "../components/Bar";
import {
  GridComponent,
  ColumnsDirective,
  ColumnDirective,
  Resize,
  Sort,
  ContextMenu,
  Filter,
  Page,
  ExcelExport,
  PdfExport,
  Edit,
  Inject,
} from "@syncfusion/ej2-react-grids";
import { contextMenuItems, ProductNone } from "../data/dummy";
import { Header } from "../components";
import { ChartsHeader, Pie as PieChart } from "../components";

const Ecommerce = () => {
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

  const [pieChartData, setPieChartData] = useState([
    { x: "", y: "", text: "" },
    { x: "", y: "", text: "" },
    { x: "", y: "", text: "" },
    { x: "Skincare", y: 56, text: `56%` },
    { x: "Makeup", y: 44, text: `44%` },
  ]);

  useEffect(() => {
    const fetch = async () => {
      const res = await http.get("/skincarepercen");
      setPieChartData((prev) => {
        prev[3].y = parseInt(res.data);
        prev[3].text = `${parseInt(res.data)}%`;
        prev[4].y = 100 - parseInt(res.data);
        prev[4].text = `${100 - parseInt(res.data)}%`;
        return prev;
      });
    };
    fetch();
  }, []);

  const editing = { allowDeleting: true, allowEditing: true };

  const [buttonColor, setButtonColor] = useState(false);
  const [soldOut, setSoldOut] = useState([]);
  useEffect(() => {
    const fetch = async () => {
      const res = await http.get(`/skincaresoldout`);
      setSoldOut(res.data);
    };
    fetch();
  }, []);

  const handleSkincare = async () => {
    const res = await http.get(`/skincaresoldout`);
    setSoldOut(res.data);
    setButtonColor(false);
  };

  const handleMakeup = async () => {
    const res = await http.get(`/makeupsoldout`);
    setButtonColor(true);
    setSoldOut(res.data);
  };

  const [topProducts, setTopProduct] = useState([]);
  useEffect(() => {
    const fetch = async () => {
      const res = await http.get("/topproduct");
      console.log(res.data);
      setTopProduct(res.data);
    };
    fetch()
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
      <Bar />
      <div style={{ display: "flex" }}>
        <div style={{ width: "40%", marginLeft: "5%" }}>
          <ChartsHeader category="Product" title="" />
          <div className="w-full">
            <PieChart
              id="chart-pie"
              data={pieChartData}
              legendVisiblity
              height="full"
            />
          </div>
        </div>
        <div>
          <div
            className="m-2 md:m-10 mt-24 p-2 md:p-10 bg-white rounded-3xl"
            style={{ width: "600px" }}
          >
            <Header category="Sold out" title="" />
            {buttonColor ? (
              <button
                onClick={handleSkincare}
                type="button"
                // style={{backgroundColor:("red" && !buttonColor)}}
                // style={{backgroudColor: "red"}}
                class="text-gray-900 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-gray-200 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700"
              >
                Skincare
              </button>
            ) : (
              <button
                type="button"
                onClick={handleSkincare}
                class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900"
              >
                Skincare
              </button>
            )}

            {!buttonColor ? (
              <button
                onClick={handleMakeup}
                type="button"
                // style={{backgroundColor:("red" && !buttonColor)}}
                // style={{backgroudColor: "red"}}
                class="text-gray-900 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-200 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700"
              >
                Makeup
              </button>
            ) : (
              <button
                type="button"
                onClick={handleMakeup}
                class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900"
              >
                Makeup
              </button>
            )}

            <GridComponent
              id="gridcomp"
              dataSource={soldOut}
              allowPaging
              allowSorting
              allowExcelExport
              allowPdfExport
              contextMenuItems={contextMenuItems}
              editSettings={editing}
            >
              <ColumnsDirective>
                {ProductNone.map((item, index) => (
                  <ColumnDirective key={index} {...item} />
                ))}
              </ColumnsDirective>
              <Inject
                services={[
                  Resize,
                  Sort,
                  ContextMenu,
                  Filter,
                  Page,
                  ExcelExport,
                  Edit,
                  PdfExport,
                ]}
              />
            </GridComponent>
          </div>
        </div>
      </div>
      <div className="m-2 md:m-10 mt-24 p-2 md:p-10 bg-white rounded-3xl">
        <Header category="" title="Top Product by Category" />

        <div class="overflow-x-auto relative">
          <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
              <tr>
                <th scope="col" class="py-3 px-6">
                  Product name
                </th>
                <th scope="col" class="py-3 px-6">
                  Image
                </th>
                <th scope="col" class="py-3 px-6">
                  Category
                </th>
                <th scope="col" class="py-3 px-6">
                  Price
                </th>
                <th scope="col" class="py-3 px-6">
                  Quantity
                </th>
              </tr>
            </thead>
            <tbody>
              {topProducts.map((product, index) =>{
                const price = new Intl.NumberFormat("vi-VN", {
                  style: "currency",
                  currency: "VND",
                }).format(product.price);
                return (
                 <tr key={index} class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                 <th
                   scope="row"
                   class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"
                 >
                   {product.name}
                 </th>
                 <td class="py-4 px-6">
                  <img src={product.image} style={{width:"50px", height:"50px"}} alt="" />
                  </td>
                 <td class="py-4 px-6">{product.category}</td>
                 <td class="py-4 px-6">{price}</td>
                 <td class="py-4 px-6">{product.number}</td>
               </tr>

              )})}
              
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default Ecommerce;
