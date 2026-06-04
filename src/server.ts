import dotenv from 'dotenv';
import express, { Request, Response } from 'express';
import cors from 'cors';
import { checkDatabaseConnection } from './config/db';

// Variables de entorno
dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(cors()); 
app.use(express.json()); 

app.get('/api/health', (req: Request, res: Response) => {
  res.status(200).json({ status: 'success', message: 'API corriendo correctamente!' });
});



app.listen(PORT, () => {
  console.log(`Server corriendo en el puerto ${PORT}`);

  checkDatabaseConnection();
});