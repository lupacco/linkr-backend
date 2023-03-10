import { getRecentPosts, insertPost } from "../repositories/home.repository.js";

export async function getPosts(req, res){
    try {
        const queryResult = await getRecentPosts()
        const posts = queryResult.rows

        return res.status(200).send(posts)
    } catch (err) {
        console.log(err)
        return res.sendStatus(500)
    }
}

export async function createPost(req, res){
    const {description, url, hashtags} = req.body
    try {
        console.log(hashtags)
        await insertPost(description, url)

        return res.sendStatus(201)
    } catch (err) {
        console.log(err)
        return res.sendStatus(500)
    }
}