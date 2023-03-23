import { getSessionByToken } from "../repositories/sessions.repository.js"

export async function validateToken(req, res, next){
    const {authorization} = req.headers
    const token = authorization.replace("Bearer ", "")
    
    try {
        const session = await getSessionByToken(token)
        
        if(!session.rows[0]) return res.sendStatus(401)

        req.loggedUserId = session.rows[0].user_id
        next()
    } catch (err) {
        console.log(err)
        return res.sendStatus(500)       
    }
}