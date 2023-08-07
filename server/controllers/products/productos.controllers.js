
import { pool } from "../../db.js";


export const products = async (req, res) =>{
   const [result] = await pool.query('select * from productos order by id asc');
   res.json(result);
}

export const product = async(req, res) =>{
    const [result] = await pool.query('select * from productos where productos.id = ?',[req.params.id,]);
    res.json(result);
}

export const addProduct = async(req , res) =>{
   try{
    const {nombre , descripcion, precio} = req.body;
    const [result] = await pool.query('insert into productos (nombre,descripcion,precio) values (?,?,?)',[nombre, descripcion, precio]);
    res.json(result);
   }catch(ERROR){
    console.error(ERROR);
   }
}



export const updateProduct = async(req, res) => {
    const {nombre, descripcion, precio} = req.body;
    const [result] = await pool.query('update productos set nombre = ?, descripcion = ?, precio = ? where productos.id = ?',[nombre,descripcion,precio,req.params.id,]);
    res.json(result);
}

export const deleteProduct = async(req, res) => {
    const ID = req.params.id;
    const [result] = await pool.query('delete from productos where id=?',[ID]);
    res.json(result);

}