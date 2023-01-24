import express from 'express';
import { PrismaClient } from '@prisma/client'

const app: express.Express = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// ローカルでしか動かさないため CROS はノーガード
app.use((req: express.Request, res: express.Response, next: express.NextFunction) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "*");
  res.header("Access-Control-Allow-Headers", "*");
  next();
})

app.listen(3000, () => {
  console.log("Start on port 3000.");
})

const prisma = new PrismaClient()

app.get('/words', async (req: express.Request, res: express.Response) => {
  res.send(JSON.stringify(await prisma.words.findMany({ take: 10 })));
})
