import Joi from "@hapi/joi";

const regexUrl = /^https?:\/\/.*/

export const postSchema = Joi.object({
    description: Joi.string(),
    url: Joi.string().regex(regexUrl).required(),
    hashtags: Joi.array()
})