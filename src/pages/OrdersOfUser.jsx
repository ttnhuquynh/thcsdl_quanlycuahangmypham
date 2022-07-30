import React, { useEffect, useState } from "react";
import http from "../http";
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

import {  contextMenuItems, ordersGridOneUser } from "../data/dummy";
import { Header } from "../components";
import { useParams } from "react-router-dom";

const OrdersOfUser = () => {
    const user_id = useParams().id;
  const editing = { allowDeleting: true, allowEditing: true };
  const [data, setData] = useState([]);
  useEffect(() => {
    const fetch = async () => {
      const res = await http.get(`/ordersofuser/${user_id}`);
      setData(res.data);
    };
    fetch();
  }, []);
  return (
    <div className="m-2 md:m-10 mt-24 p-2 md:p-10 bg-white rounded-3xl">
      <Header category="Orders" title={"User ID: " + user_id} />
      <GridComponent
        id="gridcomp"
        dataSource={data}
        allowPaging
        allowSorting
        allowExcelExport
        allowPdfExport
        contextMenuItems={contextMenuItems}
        editSettings={editing}
      >
        <ColumnsDirective>
          {ordersGridOneUser.map((item, index) => (
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
  );
};
export default OrdersOfUser;
