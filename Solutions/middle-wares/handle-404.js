//khi routing không đc tìm thấy 
module.exports = function(req, res) {
    res.statusCode = 404;
    res.end('NOT FOUND!');
}