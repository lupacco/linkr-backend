import { getUserById, getUserByUsername } from "../repositories/user.repository.js";

export async function seekUsersByName(req, res){
    const {usernameSearch} = req.body
    try {
        const queryResult = await getUserByUsername(usernameSearch)
        
        const foundUsers = queryResult.rows

        return res.status(200).send(foundUsers)
    } catch (err) {
        console.log(err)
        return res.sendStatus(500)
    }
}

export async function getSeekedUserById(req, res){
    const {id} = req.params

    try {
        const queryResult = await getUserById(id)
        const user = queryResult.rows[0]

        if(!user) return res.sendStatus(404)

        delete user.password
        
        return res.status(200).send(user)
    } catch (err) {
        console.log(err)
        return res.sendStatus(500)
    }
}

export async function getLoggedUser(req, res){
    const userId = req.loggedUserId

    try {
        const queryResult = await getUserById(userId)
        const user = queryResult.rows[0]

        delete user.password

        return res.status(200).send(user)
    } catch (err) {
        console.log(err)
        return res.sendStatus(500)
    }
}