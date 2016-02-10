// module Main

exports.renderObject = function renderObject(o) {
    return function() {
        var el = document.getElementById('piece1');

        el.innerHTML = o.turn.constructor.name;
    }
}
