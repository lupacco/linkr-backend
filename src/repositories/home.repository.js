import { db } from "../config/database.connection.js";

export async function getRecentPosts() {
  const result = await db.query(
    `SELECT * FROM posts 
    ORDER BY created_at DESC 
    LIMIT 20`
  );

  return result
}

export async function insertPost(description, url){
    await db.query(`INSERT INTO posts (description, url) VALUES ($1, $2)`, [description, url])
}
