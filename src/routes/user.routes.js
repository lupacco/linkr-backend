import { Router } from "express";
import { ListPost, enviarPost } from "../controllers/users.controller.js";

const urlRouter = Router();

urlRouter.get("/", (_, res) => {
    res.status(200).send({'asdasd': 'sdasdas'})
});

urlRouter.post("/users", enviarPost);
urlRouter.get("/users", ListPost);

export default urlRouter;
