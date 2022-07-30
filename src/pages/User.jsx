import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import http from "../http";

function User() {
  const id = useParams().id;
  const [data, setData] = useState({
    orders: 0,
    buys: 0

  })

  useEffect(()=>{
    const fetch = async() => {
        const res = await http.get('/numberorders/:id');
        setData(prev => ({
            ...prev, 
            orders: res.data[0].count
        }))
    }
    fetch()

  }, [])

  useEffect(()=>{
    const fetch = async() => {
        const res = await http.get('/bought');
        setData(prev => ({
            ...prev, 
            buys: res.data.sum
        }))
    }
    fetch()

  }, [])

  return (
    <div style={{display: "flex"}}>
      <body className=" " style={{ margin: "-150px -200px", width: "200px" }}>
        <div className="container mx-auto h-screen w-screen">
          <div className="flex items-center justify-center h-full">
            <div className="bg-white shadow-2xl p-6 rounded-2xl border-2 border-gray-50">
              <div className="flex flex-col">
                <div>
                  <h2 className="font-bold text-gray-600 text-center">
                    Orders
                  </h2>
                </div>
                <div className="my-6">
                  <div className="flex flex-row space-x-4 items-center">
                    <div id="temp">
                      <h4 className="text-4xl">{data.orders} </h4>
                      <p className="text-xs text-gray-500">sản phẩm</p>
                    </div>
                  </div>
                </div>
                <div className="w-full place-items-end text-right border-t-2 border-gray-100 mt-2">
                  <a href="#" className="text-indigo-600 text-xs font-medium">
                    Chi tiết
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </body>



      <body className=" " style={{ margin: "-150px -300px", width: "200px" }}>
        <div className="container mx-auto h-screen w-screen">
          <div className="flex items-center justify-center h-full">
            <div className="bg-white shadow-2xl p-6 rounded-2xl border-2 border-gray-50">
              <div className="flex flex-col">
                <div>
                  <h2 className="font-bold text-gray-600 text-center">
                    Tổng mua
                  </h2>
                </div>
                <div className="my-6">
                  <div className="flex flex-row space-x-4 items-center">
                    <div id="temp">
                      <h4 className="text-4xl">{data.buys}đ</h4>
                    </div>
                  </div>
                </div>
                <div className="w-full place-items-end text-right border-t-2 border-gray-100 mt-2">
                  <a href="#" className="text-indigo-600 text-xs font-medium">
                    Chi tiết
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </body>
      
      
    </div>
  );
}

export default User;
