import bcrypt from "bcrypt";
import { insertNewUser, findExistUser, exportSession } from '../repositories/users.repository.js';
import { v4 as uuid } from "uuid";

export async function signUp(req, res) {
    const { username, email, password, picture } = req.body;
  
    const passwordHash = bcrypt.hashSync(password, 10);
  
    try {

      await insertNewUser(username, email, passwordHash, picture);
  
      return res.sendStatus(201);
    } catch (err) {
      return res.status(422).send(err.message);
    }
  }
  export async function signIn(req, res) {
    const { email, password } = req.body;
  
    const { rows: users } = await findExistUser(email);
    const [user] = users;
  
    if (!user) {
      return res.sendStatus(401);
    }
  
    const passwordConfirm = bcrypt.compareSync(password, user.password);
  
    if (passwordConfirm === true) {
      const token = uuid();
      await exportSession(token, user.id);
  
      return res.status(200).send({ token });
    }
    res.sendStatus(401);
  }
