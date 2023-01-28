import express, { Express, Request, Response, NextFunction } from 'express';
import cors from 'cors';
import { initialize } from 'express-openapi';
import { getWords } from './api/operations/word';
import ApiDoc from './api/openapi.json';

const app: Express = express();

const corsOptions = {
  origin: 'https://editor.swagger.io',
  optionsSuccessStatus: 200
};
app.use(cors(corsOptions));

initialize({
  app,
  // todo: できれば yml で定義したい
  apiDoc: {
    ...JSON.parse(JSON.stringify(ApiDoc)),
  },
  validateApiDoc: false,
  operations: {
    getWords,
  },
  errorMiddleware: (err, req: Request, res: Response, _next: NextFunction) => {
    console.error(err);
    res.status(err.status || 500).json(err);
  }
});

app.listen(3000, () => {
  console.log("Start on port 3000.");
})
