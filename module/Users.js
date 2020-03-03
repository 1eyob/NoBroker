const mongoos = require('mongoose')

// mongoos.connect('mongoDb://localhost/Nobroker')
//     .then(() => console.log("User db is connected"))
//     .catch(err => console.log(err.message0))


mongoos.connect('mongodb://localhost/Nobroker')
    .then(() => console.log("User mongodb is connected "))
    .catch(err => console.log("User mongdb connection error ", err.message))



const userSchema = mongoos.Schema({
    name: {
        type: String,
        required: true,
        minLength: 1,
        maxLength: 20,
    },
    email: {
        type: String,
        //  required:true,
        minLength: 6,
        maxLength: 20,
    },
    password: {
        type: String,
        required: true,
        minLength: 3,
        maxLength: 100,
    },
    address: {
        type: String,
        required: true,
        minLength: 2,
        maxLength: 30,
    },
    isOrganization: {
        type: Boolean,
        defualt: false
    }

})

const User = mongoos.model('Users', userSchema)

module.exports.userSchema = userSchema
module.exports.User = User