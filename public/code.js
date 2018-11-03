function markLine(id) {
    document.getElementById(id).style.opacity = 1;
    checkSquare(id);
}

function checkSquare(id){
    id = id.substr(1);
    coordinates = id.split("_");
    coords = { x1: parseInt(coordinates[0]),
        y1: parseInt(coordinates[1]),
        x2: parseInt(coordinates[2]),
        y2: parseInt(coordinates[3])};

    horizontal = coords.y1 == coords.y2;
    if (horizontal) {
        if (coords.y1 >= 100 && coords.y2 < 500) {
            if (checkDownside(coords)) {
                markId = generateMarkId(coords, 50, 50);
                console.log(markId);
                // document.getElementById(markId).style.opacity = 0.5;
                document.getElementById(markId).style.visibility = "visible";
            }
        }
        if (coords.y2 <= 500 && coords.y1 > 100) {
            if (checkUpside(coords)) {
                markId = generateMarkId(coords, 50, -50);
                console.log(markId);
                // document.getElementById(markId).style.opacity = 0.5;
                document.getElementById(markId).style.visibility = "visible";
            }
        }
    }
    else {
        if (coords.x1 >= 100 && coords.x2 < 500) {
            if (checkRight(coords)) {
                markId = generateMarkId(coords, 50, 50);
                console.log(markId);
                // document.getElementById(markId).style.opacity = 0.5;
                document.getElementById(markId).style.visibility = "visible";
            }
        }
        if (coords.x2 <= 500 && coords.x1 > 100) {
            if (checkLeft(coords)) {
                markId = generateMarkId(coords, -50, 50);
                console.log(markId);
                // document.getElementById(markId).style.opacity = 0.5;
                document.getElementById(markId).style.visibility = "visible";
            }
        }
    }
}

function checkDownside(coords) {
    tempCoords = JSON.parse(JSON.stringify(coords));
    tempCoords.y1 += 100;
    tempCoords.y2 += 100;
    neighbor1 = generateId(tempCoords);
    tempCoords.y1 -= 100;
    tempCoords.x2 -= 100;
    neighbor2 = generateId(tempCoords);
    tempCoords.x1 += 100;
    tempCoords.x2 += 100;
    neighbor3 = generateId(tempCoords);
    return (document.getElementById(neighbor1).style.opacity == 1 &&
    document.getElementById(neighbor2).style.opacity == 1 &&
    document.getElementById(neighbor3).style.opacity == 1)
}

function checkUpside(coords) {
    tempCoords = JSON.parse(JSON.stringify(coords));
    tempCoords.y1 -= 100;
    tempCoords.y2 -= 100;
    neighbor1 = generateId(tempCoords);
    tempCoords.y2 += 100;
    tempCoords.x2 -= 100;
    neighbor2 = generateId(tempCoords);
    tempCoords.x1 += 100;
    tempCoords.x2 += 100;
    neighbor3 = generateId(tempCoords);
    return (document.getElementById(neighbor1).style.opacity == 1 &&
        document.getElementById(neighbor2).style.opacity == 1 &&
        document.getElementById(neighbor3).style.opacity == 1)
}

function checkLeft(coords) {
    tempCoords = JSON.parse(JSON.stringify(coords));
    tempCoords.x1 -= 100;
    tempCoords.x2 -= 100;
    neighbor1 = generateId(tempCoords);
    tempCoords.x2 += 100;
    tempCoords.y2 -= 100;
    neighbor2 = generateId(tempCoords);
    tempCoords.y1 += 100;
    tempCoords.y2 += 100;
    neighbor3 = generateId(tempCoords);
    return (document.getElementById(neighbor1).style.opacity == 1 &&
        document.getElementById(neighbor2).style.opacity == 1 &&
        document.getElementById(neighbor3).style.opacity == 1)
}

function checkRight(coords) {
    tempCoords = JSON.parse(JSON.stringify(coords));
    tempCoords.x1 += 100;
    tempCoords.x2 += 100;
    neighbor1 = generateId(tempCoords);
    tempCoords.x1 -= 100;
    tempCoords.y2 -= 100;
    neighbor2 = generateId(tempCoords);
    tempCoords.y1 += 100;
    tempCoords.y2 += 100;
    neighbor3 = generateId(tempCoords);
    console.log("right");
    console.log(neighbor1, neighbor2, neighbor3)
    return (document.getElementById(neighbor1).style.opacity == 1 &&
        document.getElementById(neighbor2).style.opacity == 1 &&
        document.getElementById(neighbor3).style.opacity == 1)
}

function generateMarkId(obj, x, y) {
    mark = {};
    console.log(obj);
    console.log(x);
    console.log(y);
    mark.x = obj.x1 + x;
    mark.y = obj.y1 + y;
    console.log(mark);
    return "l" + mark.x + "_" + mark.y;
}

function generateId(obj) {
    return "l" + obj.x1 + "_" + obj.y1 + "_" + obj.x2 + "_" + obj.y2;
}
