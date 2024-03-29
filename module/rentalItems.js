const mongoose = require('mongoose')
const { itemSchema } = require('./items')
mongoose.connect('mongodb://localhost/Nobroker')
    .then(() => console.log("REntalIt mongodb is connected "))
    .catch(err => console.log("REntalIt mongdb connection error ", err.message))

const RentalItemSchema = mongoose.Schema({
    item: {
        type: itemSchema
    },
    dateOut: {
        type: Date,
        required: true,
        default: Date.now
    },
    dateReturn: {

        type: Date,


    },


    rentalFee: {
        type: Number,
        min: 0
    },


})

const RentalItem = mongoose.model('RentalItems', RentalItemSchema)

exports.RentalItemSchema = RentalItemSchema
exports.RentalItem = RentalItem