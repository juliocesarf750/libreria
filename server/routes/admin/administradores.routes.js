import { Router } from "express";
import { addAdmin, deleteAdmin, getAdmin, getAdmins, updateAdmin } from "../../controllers/admin/administradores.controllers.js";


const router = Router();

router.get('/admins',getAdmins);
router.get('/admins/:id',getAdmin);
router.post('/admins',addAdmin);
router.put('/admins/:id',updateAdmin);
router.delete('/admins/:id',deleteAdmin);

export default router;