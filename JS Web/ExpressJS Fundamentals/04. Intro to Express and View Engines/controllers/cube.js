const Cube = require('../models/Cube');

function handleErrors(err, res, cubeBody) {
    let errors = [];

    for (const prop in err.errors) {
        errors.push(err.errors[prop].message);
    }

    //console.log(errors);
    res.locals.globalErrors = errors;
    res.render('cube/create', cubeBody);
}

module.exports = {
    createGet: (req, res) => {
        res.render('cube/create');
    },
    createPost: (req, res) => {
        const cubeBody = req.body;
        cubeBody.difficulty = Number(cubeBody.difficulty);
        // console.log(cubeBody);

        // const cubeObj = new Cube(cubeBody);
        // cubeObj.save();
        Cube.create(cubeBody)
            .then((c) => {
                res.redirect('/');
            })
            .catch((err) => handleErrors(err, res, cubeBody));
    },
    details: (req, res) => {
        const cubeId = req.params.cubeId;
        Cube.findById(cubeId)
            .then((cube) => {
                res.render('cube/details', cube);
            }).catch(err => handleErrors(err, res, cube));
    }
}