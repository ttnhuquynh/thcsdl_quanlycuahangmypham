import React from "react";
import {
  AiOutlineCalendar,
  AiOutlineShoppingCart,
} from "react-icons/ai";
import {
  FiShoppingBag,
  FiEdit,
  FiCreditCard,
} from "react-icons/fi";
import {
  BsBoxSeam,
  BsCurrencyDollar,
  BsShield,
  BsChatLeft,
} from "react-icons/bs";
import { IoMdContacts } from "react-icons/io";
import { MdOutlineSupervisorAccount } from "react-icons/md";
import { TiTick } from "react-icons/ti";
import { GrLocation } from "react-icons/gr";

import { Link } from "react-router-dom";

export const gridProduct = (props) => (
  <div>
    <Link to={"/editproduct/" + props.product_id}>
      <img
        className="rounded-xl h-20 md:ml-3"
        src={props.image}
        alt="image-item"
      />
    </Link>
  </div>
);

export const Name = (props) => 
  (<div >
    <Link to={"/user/" + props.user_id}>
    {props.name}
    </Link>
  </div>);

export const Status = (props) => (
  <div>
    {props.status == "0" ? (
      <button
        type="button"
        className="text-white bg-red-700 hover:bg-red-800 focus:outline-none focus:ring-4 focus:ring-red-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900"
      >
        Chưa thanh toán
      </button>
    ) : (
      <button
        type="button"
        className="text-white bg-yellow-400 hover:bg-yellow-500 focus:outline-none focus:ring-4 focus:ring-yellow-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:focus:ring-yellow-900"
      >
        Đã thanh toán
      </button>
    )}
  </div>
);

export const Money = (props) => (
  <div>
    {new Intl.NumberFormat("vi-VN", {
        style: "currency",
        currency: "VND",
      }).format(props.total)}
  </div>
);

export const gridOrderImageMakeup = (props) => (
  <div>
    <Link to={"/editmakeup/" + props.product_id}>
      <img
        className="rounded-xl h-20 md:ml-3"
        src={props.anh}
        alt="image-item"
      />
    </Link>
  </div>
);

export const gridOrderStatus = (props) => (
  <button
    type="button"
    style={{ background: props.StatusBg }}
    className="text-white py-1 px-2 capitalize rounded-2xl text-md"
  >
    {props.Status}
  </button>
);

const customerGridImage = (props) => (
  <div className="image flex gap-4">
    <img
      className="rounded-full w-10 h-10"
      src={props.CustomerImage}
      alt="employee"
    />
    <div>
      <p>{props.CustomerName}</p>
      <p>{props.CustomerEmail}</p>
    </div>
  </div>
);

const customerGridStatus = (props) => (
  <div className="flex gap-2 justify-center items-center text-gray-700 capitalize">
    <p
      style={{ background: props.StatusBg }}
      className="rounded-full h-3 w-3"
    />
    <p>{props.Status}</p>
  </div>
);



export const barPrimaryXAxis = {
  valueType: "Category",
  interval: 1,
  majorGridLines: { width: 0 },
};
export const barPrimaryYAxis = {
  majorGridLines: { width: 0 },
  majorTickLines: { width: 0 },
  lineStyle: { width: 0 },
  labelStyle: { color: "transparent" },
};


export const barChartData = [
  [
    { x: new Date().toLocaleDateString(), y: 46 },
    { x: "GBR", y: 27 },
    { x: "CHN", y: 26 },
  ],
  [
    { x: new Date().toLocaleDateString(), y: 37 },
    { x: "GBR", y: 23 },
    { x: "CHN", y: 18 },
  ],
];

export const barCustomSeries = [
  {
    dataSource: barChartData[0],
    xName: "x",
    yName: "y",
    name: "Gold",
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
    name: "Silver",
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
export const colorMappingData = [
  [
    { x: "Jan", y: 6.96 },
    { x: "Feb", y: 8.9 },
    { x: "Mar", y: 12 },
    { x: "Apr", y: 17.5 },
    { x: "May", y: 22.1 },
    { x: "June", y: 25 },
    { x: "July", y: 29.4 },
    { x: "Aug", y: 29.6 },
    { x: "Sep", y: 25.8 },
    { x: "Oct", y: 21.1 },
    { x: "Nov", y: 15.5 },
    { x: "Dec", y: 9.9 },
  ],
  ["#FFFF99"],
  ["#FFA500"],
  ["#FF4040"],
];

export const rangeColorMapping = [
  { label: "1°C to 10°C", start: "1", end: "10", colors: colorMappingData[1] },

  {
    label: "11°C to 20°C",
    start: "11",
    end: "20",
    colors: colorMappingData[2],
  },

  {
    label: "21°C to 30°C",
    start: "21",
    end: "30",
    colors: colorMappingData[3],
  },
];

export const ColorMappingPrimaryXAxis = {
  valueType: "Category",
  majorGridLines: { width: 0 },
  title: "Months",
};

export const ColorMappingPrimaryYAxis = {
  lineStyle: { width: 0 },
  majorTickLines: { width: 0 },
  minorTickLines: { width: 0 },
  labelFormat: "{value}°C",
  title: "Temperature",
};

export const FinancialPrimaryXAxis = {
  valueType: "DateTime",
  minimum: new Date("2016, 12, 31"),
  maximum: new Date("2017, 9, 30"),
  crosshairTooltip: { enable: true },
  majorGridLines: { width: 0 },
};

export const FinancialPrimaryYAxis = {
  title: "Price",
  minimum: 100,
  maximum: 180,
  interval: 20,
  lineStyle: { width: 0 },
  majorTickLines: { width: 0 },
};
export const LinePrimaryXAxis = {
  valueType: "DateTime",
  labelFormat: "y",
  intervalType: "Years",
  edgeLabelPlacement: "Shift",
  majorGridLines: { width: 0 },
  background: "white",
};
export const LinePrimaryYAxis = {
  labelFormat: "{value}%",
  rangePadding: "None",
  minimum: 0,
  maximum: 100,
  interval: 20,
  lineStyle: { width: 0 },
  majorTickLines: { width: 0 },
  minorTickLines: { width: 0 },
};
export const customersGrid = [
  { type: "checkbox", width: "50" },
  {
    headerText: "Name",
    width: "150",
    template: customerGridImage,
    textAlign: "Center",
  },
  {
    field: "ProjectName",
    headerText: "Project Name",
    width: "150",
    textAlign: "Center",
  },
  {
    field: "Status",
    headerText: "Status",
    width: "130",
    format: "yMd",
    textAlign: "Center",
    template: customerGridStatus,
  },
  {
    field: "Weeks",
    headerText: "Weeks",
    width: "100",
    format: "C2",
    textAlign: "Center",
  },
  {
    field: "Budget",
    headerText: "Budget",
    width: "100",
    format: "yMd",
    textAlign: "Center",
  },

  {
    field: "Location",
    headerText: "Location",
    width: "150",
    textAlign: "Center",
  },
  {
    field: "CustomerID",
    headerText: "Customer ID",
    width: "120",
    textAlign: "Center",
    isPrimaryKey: true,
  },
];

export const links = [
  {
    title: "Dashboard",
    links: [
      {
        name: "ecommerce",
        icon: <FiShoppingBag />,
      },
    ],
  },

  {
    title: "Product",
    links: [
      {
        name: "Skincare",
        icon: <AiOutlineShoppingCart />,
      },
      {
        name: "Makeup",
        icon: <IoMdContacts />,
      },
    ],
  },
  {
    title: "Order",
    links: [
      {
        name: "Add",
        icon: <AiOutlineCalendar />,
      },
      {
        name: "Orders",
        icon: <FiEdit />,
      },
    ],
  },

  {
    title: "User",
    links: [
      {
        name: "Users",
        icon: <AiOutlineCalendar />,
      },
      
    ],
  },
  
];

export const themeColors = [
  {
    name: "blue-theme",
    color: "#1A97F5",
  },
  {
    name: "green-theme",
    color: "#03C9D7",
  },
  {
    name: "purple-theme",
    color: "#7352FF",
  },
  {
    name: "red-theme",
    color: "#FF5C8E",
  },
  {
    name: "indigo-theme",
    color: "#1E4DB7",
  },
  {
    color: "#FB9678",
    name: "orange-theme",
  },
];

export const userProfileData = [
  {
    icon: <BsCurrencyDollar />,
    title: "My Profile",
    desc: "Account Settings",
    iconColor: "#03C9D7",
    iconBg: "#E5FAFB",
  },
  {
    icon: <BsShield />,
    title: "My Inbox",
    desc: "Messages & Emails",
    iconColor: "rgb(0, 194, 146)",
    iconBg: "rgb(235, 250, 242)",
  },
  {
    icon: <FiCreditCard />,
    title: "My Tasks",
    desc: "To-do and Daily Tasks",
    iconColor: "rgb(255, 244, 229)",
    iconBg: "rgb(254, 201, 15)",
  },
];

export const ProductGrip = [
  {
    headerText: "Image",
    template: gridProduct,
    textAlign: "Center",
    width: "120",
  },
  {
    field: "name",
    headerText: "Name",
    width: "160",
    editType: "dropdownedit",
    textAlign: "Center",
  },

  {
    field: "number",
    headerText: "Number",
    width: "110",
    editType: "dropdownedit",
    textAlign: "Center",
  },

  {
    field: "description",
    headerText: "Description",
    width: "150",
    textAlign: "Center",
  },
  {
    field: "price",
    headerText: "Price",
    // format: 'C2',
    textAlign: "Center",
    editType: "numericedit",
    width: "100",
  },

  {
    field: "brand",
    headerText: "Brand",
    width: "100",
    textAlign: "Center",
  },

  {
    field: "product_id",
    headerText: "ID",
    width: "80",
    textAlign: "Center",
  },

  {
    field: "category",
    headerText: "Category",
    width: "120",
    textAlign: "Center",
  },
  {
    field: "created_at",
    headerText: "Created_at",
    width: "150",
    textAlign: "Center",
  },
];

export const ProductNone = [
  {
    headerText: "Image",
    template: gridProduct,
    textAlign: "Center",
    width: "120",
  },
  {
    field: "name",
    headerText: "Name",
    width: "150",
    editType: "dropdownedit",
    textAlign: "Center",
  },

  {
    field: "price",
    headerText: "Price",
    textAlign: "Center",
    editType: "numericedit",
    width: "150",
  },

  {
    field: "product_id",
    headerText: "Product ID",
    width: "120",
    textAlign: "Center",
  },
  

];

export const ordersGridUser = [
  {
    field: "user_id",
    headerText: "ID",
    width: "150",
    editType: "dropdownedit",
    textAlign: "Center",
  },
  {
    headerText: "Tên",
    template: Name,
    textAlign: "Center",
    width: "150",
  },
  {
    field: "phone",
    headerText: "Phone Number",
    width: "150",
    textAlign: "Center",
  },
  {
    field: "email",
    headerText: "Email",
    textAlign: "Center",
    editType: "numericedit",
    width: "150",
  },
  {
    field: "address",
    headerText: "Address",
    textAlign: "Center",
    editType: "numericedit",
    width: "150",
  },
];

export const ordersGrid = [
  {
    field: "order_id",
    headerText: "Order ID",
    width: "100",
    editType: "dropdownedit",
    textAlign: "Center",
  },
  {
    field: "user_id",
    headerText: "User ID",
    textAlign: "Center",
    editType: "numericedit",
    width: "100",
  },
  {
    field: "product_id",
    headerText: "Product ID",
    width: "100",
    textAlign: "Center",
  },
  {
    field: "number",
    headerText: "Quatity",
    width: "100",
    textAlign: "Center",
  },
 
  {
    field: "created_at",
    headerText: "Created At",
    width: "150",
    textAlign: "Center",
  },
  
];

export const ordersGridOneUser = [
  {
    field: "order_id",
    headerText: "Order ID",
    width: "150",
    editType: "dropdownedit",
    textAlign: "Center",
  },
  {
    field: "product_id",
    headerText: "Product ID",
    width: "150",
    textAlign: "Center",
  },
  {
    field: "number",
    headerText: "Number of Product",
    textAlign: "Center",
    editType: "numericedit",
    width: "150",
  },
  {
    headerText: "Total",
    template: Money,

    width: "150",
    textAlign: "Center",
  },
  {
    headerText: "Status",
    template: Status,
    textAlign: "Center",
    width: "150",
  },
];

export const ordersGridMakeup = [
  {
    headerText: "Ảnh",
    template: gridOrderImageMakeup,
    textAlign: "Center",
    width: "120",
  },
  {
    field: "ten",
    headerText: "Tên",
    width: "150",
    editType: "dropdownedit",
    textAlign: "Center",
  },
  { field: "mota", headerText: "Mô tả", width: "150", textAlign: "Center" },
  {
    field: "gia",
    headerText: "Giá",
    textAlign: "Center",
    editType: "numericedit",
    width: "150",
  },
  
  {
    field: "tenthuonghieu",
    headerText: "Tên thương hiệu",
    width: "150",
    textAlign: "Center",
  },

  {
    field: "product_id",
    headerText: "Product ID",
    width: "120",
    textAlign: "Center",
  },

  {
    field: "loaisp",
    headerText: "Loại sản phẩm",
    width: "150",
    textAlign: "Center",
  },
  {
    field: "created_at",
    headerText: "Ngày tạo",
    width: "150",
    textAlign: "Center",
  },
];

export const contextMenuItems = [
  "AutoFit",
  "AutoFitAll",
  "SortAscending",
  "SortDescending",
  "Copy",
  "Edit",
  "Delete",
  "Save",
  "Cancel",
  "PdfExport",
  "ExcelExport",
  "CsvExport",
  "FirstPage",
  "PrevPage",
  "LastPage",
  "NextPage",
];








