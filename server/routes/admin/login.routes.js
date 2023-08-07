import { Router } from "express";
import { deleteUser, getUser, getUsers, login, register} from "../../controllers/admin/login.controllers.js";

const router = Router();

router.post('/register',register);
router.post('/login', login);
router.get('/users',getUsers);
router.get('/users/:id',getUser);
router.delete('/users/:id',deleteUser);

export default router;