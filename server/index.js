import express from "express";
import { PORT } from "./config.js";
import indexRoutes from './routes/index.routes.js';
import loginRoutes from './routes/admin/login.routes.js';
import employeesRoutes from './routes/admin/empleados.routes.js';
import adminsRoutes from './routes/admin/administradores.routes.js';
import productRoutes from './routes/products/productos.routes.js';
import cors from 'cors';
const app = express();


app.use(cors());

app.use(express.json());

app.use(indexRoutes);
app.use(loginRoutes);
app.use(employeesRoutes);
app.use(adminsRoutes);
app.use(productRoutes);
app.listen(PORT);

console.log(`sever is runnig on port ${PORT}`);