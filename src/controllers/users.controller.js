import db from "../config/database.config.js";

export async function ListPost(_req, res) {
  //const id = Number(req.params.id);
  const limit = 3;

  try {
    const postExist = await db.query('SELECT "id", "content", "url" FROM posts ORDER BY created_at DESC LIMIT 20');
    //if (!postExist.rowCount > 0) return res.sendStatus(404);

    res.status(200).send(postExist.rows);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export async function enviarPost(req, res) {
  const { url, content } = req.body;

  try {
    await db.query(
      `
        INSERT INTO posts (content, url) 
        VALUES ($1, $2);
        `,
      [content, url]
    );
    const createPost = await db.query("SELECT * FROM posts WHERE url=$1", [
      url,
    ]);

    res.status(201).send({
      id: createPost.rows[0].id,
      content: createPost.rows[0].content,
      url: createPost.rows[0].url,
    });
  } catch (error) {
    res.status(500).send(error.message);
  }
}
