import { pool } from "../../db.js";

export const getEmployees = async(req, res) => {
   try{
    const [result] = await pool.query('select * from empleados order by codigo asc');
    res.json(result);
   }catch(ERROR){
    console.error(Error);
   }
}


export const getEmployee = async(req, res) => {
    const ID = req.params.id;
    const [result] = await pool.query('select * from empleados where empleados.codigo = ?',[ID]);
    res.json(result);
}

export const addEmployee = async(req, res) => {
    const {codigo, usuario_id , departamento} = req.body
    const [result] = await pool.query('insert into empleados (codigo, usuario_id, departamento) values(?, ?, ?)',[codigo, usuario_id,departamento]);
    res.json(result);
}

export const updateEmployee = async(req, res) => {
    const {codigo, usuario_id, departamento} = req.body;
    const ID = req.params.id;
    const [result] = await pool.query('update empleados set codigo = ?, usuario_id = ?, departamento = ? where empleados.codigo = ?',[codigo,usuario_id,departamento,ID]);
    res.json(result);
}

export const deleteEmployee = async(req, res) => {
    const ID = req.params.id;
    const [result] = await pool.query('delete from empleados where empleados.codigo = ?',[ID]);
    res.json(result);
}
