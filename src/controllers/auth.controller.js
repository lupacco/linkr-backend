import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";
import { createUser } from "../repositories/users.repository.js";

export async function signIn(req, res) {
  const user = req.user;
  const token = uuid();
  try {
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}

export async function signUp(req, res) {
  const { username, email, password, pictureUrl } = req.body;
  const hashPassword = bcrypt.hashSync(password, 10);

  try {
    await createUser(username, email, hashPassword, pictureUrl);
    return res.sendStatus(201);
  } catch (err) {
    console.log(err);
    return res.sendStatus(500);
  }
}
