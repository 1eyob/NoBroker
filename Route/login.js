const express = require('express')
const { User } = require('../module/Users')
const route = express.Router()

route.use(express.json())

route.get('/', async(req, res) => {
    let user = await User.findOne({ email: req.header('email') })

    if (!user) return res.status(401).send("user not found")


    if (user.password == req.header('password'))
        return res.send(user)

    return res.status(401).send("user not found")

})


module.exports = route