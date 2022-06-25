// routes/user.js
const express = require('express');

const router = express.Router();

// CONTROLLER
const userCtrl = require('../controllers/userController');

//Middlewares
const upload = require('../middlewares/multerM');
const valRegM = require('../middlewares/valRegM');
const valLogM = require('../middlewares/valLogM');

router.get('/login',userCtrl.showLogin)
router.post('/login',valLogM,userCtrl.login)

router.get('/register',userCtrl.showRegister)
router.post('/register',upload.single('img'),valRegM,userCtrl.register)

// exports
module.exports = router