import { db } from "../config/database.connection.js";

export async function getSessionByToken(token) {
  const result = await db.query(`SELECT * FROM sessions WHERE token=$1`, [
    token,
  ]);

  return result;
}
