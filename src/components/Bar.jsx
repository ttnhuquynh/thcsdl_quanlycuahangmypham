import React, { useState, useEffect } from "react";
import {
  ChartComponent,
  SeriesCollectionDirective,
  SeriesDirective,
  Inject,
  Legend,
  Category,
  Tooltip,
  ColumnSeries,
  DataLabel,
} from "@syncfusion/ej2-react-charts";

import { barPrimaryXAxis, barPrimaryYAxis } from "../data/dummy";
import { ChartsHeader } from "../components";
import http from "../http";

function Bar() {
  let today = new Date();
  let yesterday = new Date();
  yesterday.setDate(yesterday.getDate() - 1);
  yesterday =
    yesterday.getFullYear() +
    "/" +
    (yesterday.getMonth() + 1) +
    "/" +
    yesterday.getDate();

  let three_days_ago = new Date();
  three_days_ago.setDate(three_days_ago.getDate() - 2);
  three_days_ago =
    three_days_ago.getFullYear() +
    "/" +
    (three_days_ago.getMonth() + 1) +
    "/" +
    three_days_ago.getDate();
  const [data, setData] = useState({
    ySalesToday: 0,
    ySalesYesterday: 0,
    ySalesThreeDayAgo: 0,
    yOrdersToday: 0,
    yOrdersYesterday: 0,
    yOrdersThreeDayAgo: 0,
  });

  const barChartData = [
    [
      { x: new Date().toLocaleDateString(), y: data.ySalesToday },
      { x: yesterday, y: data.ySalesYesterday },
      { x: three_days_ago, y: data.ySalesThreeDayAgo },
    ],
    [
      { x: new Date().toLocaleDateString(), y: data.yOrdersToday },
      { x: yesterday, y: data.yOrdersYesterday },
      { x: three_days_ago, y: data.yOrdersThreeDayAgo },
    ],
  ];

  useEffect(() => {
    const fetch = async () => {
      const res = await http.get("/paymentsyesterday");
      setData((prev) => ({ ...prev, ySalesYesterday: res.data[0].total/1000000 }));
    };
    fetch();
  }, []);
  useEffect(() => {
    const fetch = async () => {
      const res = await http.get("/paymentstoday");
      setData((prev) => ({ ...prev, ySalesToday: res.data[0].total/100000000 }));
    };
    fetch();
  }, []);
  useEffect(() => {
    const fetch = async () => {
      const res = await http.get("/paymentsthreedayago");
      setData((prev) => ({ ...prev, ySalesThreeDayAgo: res.data[0].total/1000000 }));
    };
    fetch();
  }, []);

  useEffect(() => {
    const fetch = async () => {
      const res = await http.get("/ordersyesterday");
      setData((prev) => ({ ...prev, yOrdersYesterday: res.data[0].total }));
    };
    fetch();
  }, []);

  useEffect(() => {
    const fetch = async () => {
      const res = await http.get("/orderstoday");
      setData((prev) => ({ ...prev, yOrdersToday: res.data[0].total }));
    };
    fetch();
  }, []);
  useEffect(() => {
    const fetch = async () => {
      const res = await http.get("/ordersthreedayago");
      setData((prev) => ({ ...prev, yOrdersThreeDayAgo: res.data[0].total }));
    };
    fetch();
  }, []);

  const barCustomSeries = [
    {
      dataSource: barChartData[0],
      xName: "x",
      yName: "y",
      name: "Sales",
      type: "Column",
      marker: {
        dataLabel: {
          visible: true,
          position: "Top",
          font: { fontWeight: "600", color: "#ffffff" },
        },
      },
    },
    {
      dataSource: barChartData[1],
      xName: "x",
      yName: "y",
      name: "Orders",
      type: "Column",
      marker: {
        dataLabel: {
          visible: true,
          position: "Top",
          font: { fontWeight: "600", color: "#ffffff" },
        },
      },
    },
  ];

  return (
    <div>
      <div className="m-4 md:m-10 mt-24 p-10 bg-white dark:bg-secondary-dark-bg rounded-3xl">
        <ChartsHeader category="" title="" />
        <div className=" w-full">
          <ChartComponent
            id="charts"
            primaryXAxis={barPrimaryXAxis}
            primaryYAxis={barPrimaryYAxis}
            chartArea={{ border: { width: 0 } }}
            tooltip={{ enable: true }}
            background={"#fff"}
            legendSettings={{ background: "white" }}
          >
            <Inject
              services={[ColumnSeries, Legend, Tooltip, Category, DataLabel]}
            />
            <SeriesCollectionDirective>
              {barCustomSeries.map((item, index) => (
                <SeriesDirective key={index} {...item} />
              ))}
            </SeriesCollectionDirective>
          </ChartComponent>
        </div>
      </div>
    </div>
  );
}

export default Bar;
