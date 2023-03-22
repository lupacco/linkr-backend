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
        const response = await insertPost(description, url)
        if(hashtags.length > 0){
            console.log("existe item")
            console.log(response)
        }
        else{
            console.log("vazio")
        }

        return res.sendStatus(201)
    } catch (err) {
        console.log(err)
        return res.sendStatus(500)
    }
}