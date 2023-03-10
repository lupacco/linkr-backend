import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";
import { createUser, generateSession } from "../repositories/users.repository.js";

export async function signIn(req, res) {
  const user = req.user;
  const token = uuid();
  try {
    const session = await generateSession(user.id, token)

    return res.status(200).send(token)
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
