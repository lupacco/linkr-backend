import joi from "@hapi/joi"

const regexUrl = /^https?:\/\/.*/

export const singUpSchema = joi.object({
    username: joi.string().min(1).required(),
    email: joi.string().email().required(),
    password: joi.string().required(),
    pictureUrl: joi.string().regex(regexUrl)
  });
  
  export const signInSchema = joi.object({
    email: joi.string().email().required(),
    password: joi.string().required()
  });