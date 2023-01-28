import { Response } from 'express';
import { PrismaClient } from '@prisma/client';

type GetWordsRequest = {
  offset: number,
  limit: number,
};

export const getWords = async (req: GetWordsRequest, res: Response) => {
  const prisma = new PrismaClient();
  const words = await prisma.words.findMany({ take: req.limit ?? 10 });
  res.send({
    // todo: ここで構造の知識持たず、シリアライザみたいなのに map する
    words: words,
    wordsCounts: words.length,
  });
}
