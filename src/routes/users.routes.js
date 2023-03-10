import { Router } from "express";
//controllers
import { seekUsersByName, getLoggedUser, getSeekedUserById } from "../controllers/users.controller.js";
//middlewares
import { validateToken } from "../middlewares/validateToken.js";

const usersRouter = Router();


usersRouter.get("/users", seekUsersByName)
usersRouter.get("/users/me", validateToken, getLoggedUser);
usersRouter.get("/users/:id", validateToken, getSeekedUserById);

export default usersRouter;
