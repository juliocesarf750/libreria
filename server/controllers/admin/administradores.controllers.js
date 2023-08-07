import { pool } from "../../db.js";

export const getAdmins = async(req, res) => {
    const [result] = await pool.query('select * from administradores order by codigo asc');
    res.json(result);
} 

export const getAdmin = async (req, res) => {
    try{
        const [result] = await pool.query('select * from administradores where administradores.codigo = ?',[req.params.id,]);
        res.json(result);
    }catch(ERROR){
        console.error(ERROR);
    }
}

export const addAdmin = async (req, res) => {
    const {codigo, usuario_id, privilegios} = req.body;
    const [result] = await pool.query('insert into administradores (codigo, usuario_id, privilegios) values (?, ?, ?)',[codigo, usuario_id, privilegios]);
    res.json(result);
}

export const updateAdmin = async (req, res) => {
    const [codigo, usuario_id, privilegios] = req.body;
    const [result] = pool.query('update administradores set codigo = ?, usuario_id = ?, privilegios = ? where administradores.codigo = ?',[codigo,usuario_id,privilegios,req.params.id]);
    res.json(result);
}

export const deleteAdmin = async (req, res) => {
    const [result] = await pool.query('delete from administradores where administradores.codigo = ?',[req.params.id]);
    res.json(result);
}