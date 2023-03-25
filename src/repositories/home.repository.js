import { db } from "../config/database.connection.js";

export async function getRecentPosts() {
  const result = await db.query(
    `SELECT * FROM posts 
    ORDER BY created_at DESC 
    LIMIT 20`
  );

  return result
}

export async function insertPost(description, url, userId){
    const result = await db.query(`INSERT INTO posts (description, url, user_id) VALUES ($1, $2, $3)`, [description, url, userId])

    return result
}
