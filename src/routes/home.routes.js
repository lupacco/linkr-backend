import { Router } from "express";
//controllers
import { createPost, getPosts } from "../controllers/home.controller.js";
//middlewares
import { validateToken } from "../middlewares/validateToken.js";
import { validateSchema } from "../middlewares/validateSchema.js";
//schemas
import { postSchema } from "../schemas/postSchema.js";

const homeRouter = Router()

homeRouter.get("/home", getPosts)
homeRouter.post("/home/posts", validateToken, validateSchema(postSchema), createPost)
homeRouter.delete("/home/posts/:id")
homeRouter.patch("/home/posts/:id")

export default homeRouter