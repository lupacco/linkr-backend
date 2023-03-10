import  db  from "../config/database.config.js"

export async function insertNewUser(username, email, passwordHash, picture) {
    return db.query(
      'INSERT INTO users (email,password,username,picture) VALUES ($1, $2, $3, $4)',
      [email, passwordHash, username, picture]
    );
  }

  export async function findExistUser(email) {
    return db.query(`SELECT * FROM users WHERE email = $1 `, [email]);
  }
  
  export async function exportSession(token, id) {
    return db.query(
      `
  INSERT INTO sessions (token, "userId") VALUES ($1, $2)`,
      [token, id]
    );
  }
  