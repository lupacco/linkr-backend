import { db } from "../config/database.connection.js";

export async function getUserByUsername(username){
  const result = await db.query(`SELECT * FROM users WHERE username ILIKE '${username}%'`)

  return result
}

export async function getUserByEmail(email) {
  const result = await db.query(`SELECT * FROM users WHERE email=$1`, [email]);

  return result;
}

export async function getUserById(id){
  const result = await db.query(`SELECT * FROM users WHERE id=$1`, [id]);

  return result;
}

export async function createUser(username, email, password, pictureUrl) {
  await db.query(
    `INSERT INTO users (username, email, password, picture_url) VALUES ($1,$2,$3, $4)`,
    [username, email, password, pictureUrl]
  );

}

export async function generateSession(userId, token) {
  const result = db.query(
    `INSERT INTO sessions (user_id, token) VALUES ($1,$2)`,
    [userId, token]
  );

  return result;
}
