import { createPool } from "mysql2/promise";

//base de datos en la nube
/*export const pool = createPool({
   host:'containers-us-west-71.railway.app',
   user:'root',
   database:'railway',
   port:'7835',
   password:'XGD7GLQsQbg6V2OBpPII'
});*/

// base de datos local
export const pool = createPool({
   host:'localhost',
   user:'root',
   database:'ventas_productos_escolares',
   port:'3306',
   password:'HolaMundo123'
});