import { Router } from "express";
import { signUp } from "../controllers/auth.controller.js";
import { checkEmailExistence, validateLogin } from "../middlewares/authValidations.js";

const authRouter = Router();

authRouter.post("/", validateLogin);
authRouter.post("/signup", checkEmailExistence, signUp);

export default authRouter