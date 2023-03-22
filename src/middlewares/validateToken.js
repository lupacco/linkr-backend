import { getSessionByToken } from "../repositories/sessions.repository.js"

export async function validateToken(req, res, next){
    const {authorization} = req.headers
    
    try {
        const session = await getSessionByToken(authorization)
        
        if(!session.rows[0]) return res.sendStatus(401)

        req.loggedUserId = session.rows[0].user_id
        next()
    } catch (err) {
        console.log(err)
        return res.sendStatus(500)       
    }
}