import bcrypt from 'bcrypt';
import { pool } from '../../db.js';


export const register = async (req, res) => {
    try {
        const { nombre, apellido, telefono , email, contrasena, categoria } = req.body;

        
        if (!nombre || !apellido || !telefono || !email || !contrasena || !categoria) {
            return res.status(400).json({ message: 'Todos los campos son requeridos' });
        }

         if (!isValidEmail(email)) {
            return res.status(400).json({ message: 'Formato de correo electrónico inválido' });
        }

        
        const [existingUser] = await pool.query('SELECT id FROM usuarios WHERE email = ?', [email]);
        if (existingUser.length > 0) {
            return res.status(409).json({ message: 'El correo electrónico ya está registrado' });
        }

        
        const saltRounds = 10;
        const hashedPassword = await bcrypt.hash(contrasena, saltRounds);

        
        const [result] = await pool.query(
            'INSERT INTO usuarios (nombre,apellido, telefono, email, contrasena, categoria) VALUES (?,?,?, ?, ?, ?)',
            [nombre, apellido, telefono, email, hashedPassword, categoria]
        );

        res.json(result);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error interno del servidor' });
    }
};

function isValidEmail(email) {
    
    return /\S+@\S+\.\S+/.test(email);
}






export const login = async (req, res) => {
    try {
        const { email, contrasena } = req.body;

       
        if (!email || !contrasena) {
            return res.status(400).json({ message: 'Email and password are required' });
        }

        
        const [users] = await pool.query('SELECT * FROM usuarios WHERE email = ?', [email]);
        const user = users[0];

        if (!user) {
            return res.status(401).json({ message: 'Invalid email or password' });
        }

      
        const isPasswordMatch = await bcrypt.compare(contrasena, user.contrasena);

        if (!isPasswordMatch) {
            return res.status(401).json({ message: 'Invalid email or password' });
        }

        
        res.json({ message: 'Login successful' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }
};


export const getUsers = async(req, res) =>{
  try{
    const [result] = await pool.query('select * from usuarios');
    res.json(result);
  }catch(ERROR){
    console.error(ERROR);
  }
  

};

export const getUser = async(req, res) => {
    try{
   

    const [result] = await pool.query('select * from usuarios where id = ?',[req.params.id,]);
    res.json(result);

    }catch(ERROR){
        console.error(ERROR);
    }



}

export const deleteUser = async (req, res) => {
    try {
      const [result] = await pool.query('DELETE FROM usuarios WHERE id = ?', [req.params.id]);
      
      if (result.affectedRows === 0) {
        return res.status(404).json({ message: 'Usuario no encontrado' });
      }
  
      res.json({ message: 'Usuario eliminado exitosamente' });
    } catch (error) {
      console.error('Error al eliminar el usuario:', error);
      res.status(500).json({ message: 'Error al eliminar el usuario' });
    }
  };




