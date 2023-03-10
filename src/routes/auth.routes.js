import { Router } from "express";
//controllers
import { signIn, signUp } from "../controllers/auth.controller.js";
//schemas
import { signInSchema, singUpSchema } from "../schemas/authSchema.js";
//middlewares
import { validateSchema } from "../middlewares/validateSchema.js";
import { checkEmailExistence, validateLogin } from "../middlewares/authValidations.js";

const authRouter = Router();

authRouter.post("/", validateSchema(signInSchema), validateLogin, signIn);
authRouter.post("/signup", validateSchema(singUpSchema), checkEmailExistence, signUp);

export default authRouter