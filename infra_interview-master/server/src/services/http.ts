import * as cors from "cors";
import * as express from "express";
import { Server } from "http";
import * as randomName from "node-random-name";
import { Tedis } from "tedis";
import { Connection } from "typeorm";
import { User } from "../entity/User";
import { ServerConfig } from "./config";

export function server(
  db: Connection,
  redis: Tedis,
  config: ServerConfig
): Promise<Server> {
  const app = express();
  app.use(cors());

  app.post("/clearUsers", async (_, res) => {
    await db.manager.clear(User);
    return res.json([]);
  });

  app.get("/getUsers", async (_, res) => {
    console.log("get users")
    const users = await db.manager.find(User);
    console.log(users)
    return res.json(users);
  });

  app.post("/makeUser", async (_, res) => {
    const user = new User();
    user.firstName = randomName({ first: true });
    user.lastName = randomName({ last: true });
    user.age = Math.floor(Math.random() * 100 + 1);
    console.log(user)
    await db.manager.save(user);
    console.log("inserted")
    const users = await db.manager.find(User);
    console.log(users)
    return res.json(users);
  });

  app.get("/getVisited", async (_, res) => {
    console.log('reci')
    const visited = await redis.incr("visitors");
    console.log(visited)
    return res.json({ visited });
  });

  app.post("/clearVisited", async (_, res) => {
    await redis.getset("visitors", "0");
    return res.json({ visited: 0 });
  });

  return new Promise((resolve) => {
    const server = app.listen(config.port, () => {
      console.log(`App listening on port ${config.port}`);
      resolve(server);
    });
  });
}
