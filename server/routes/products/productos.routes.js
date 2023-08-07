import { Router } from "express";
import { addProduct, deleteProduct, product, products, updateProduct } from "../../controllers/products/productos.controllers.js";

const router = Router();

//obtener todos los productos
router.get('/products',products);
//obtener un producto por su id
router.get('/products/:id', product);
//agregar un producto
router.post('/products', addProduct);
//editar un producto
router.put('/products/:id', updateProduct);
//eliminar un producto
router.delete('/products/:id', deleteProduct);

export default router;