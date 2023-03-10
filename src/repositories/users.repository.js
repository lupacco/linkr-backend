import { db } from "../config/database.connection.js";

export async function getUserByEmail(email) {
  const result = await db.query(`SELECT * FROM users WHERE email=$1`, [email]);

  return result;
}

export async function createUser(username, email, password, pictureUrl) {
  const result = db.query(
    `INSERT INTO users (username, email, password, picture_url) VALUES ($1,$2,$3, $4)`,
    [username, email, password, pictureUrl]
  );

  return result;
}
