import joi from "@hapi/joi";

const regexUrl = /^https?:\/\/.*/;

export const postSchema = joi.object({
  description: joi.string().required(),
  url: joi.string().regex(regexUrl).required(),
  hashtags: joi.array().allow(""),
  userId: joi.number().required()
});
