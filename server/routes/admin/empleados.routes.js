import { Router } from "express";
import { addEmployee, deleteEmployee, getEmployee, getEmployees, updateEmployee } from "../../controllers/admin/empleados.controllers.js";

const router = Router();

router.get('/employees',getEmployees);
router.get('/employees/:id',getEmployee);
router.post('/employees',addEmployee);
router.put('/employees/:id',updateEmployee);
router.delete('/employees/:id',deleteEmployee);

export default router;