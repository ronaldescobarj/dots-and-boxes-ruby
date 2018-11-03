turns = ["#354698", "#C42615", "#EAA81D", "#86B71B", "#7A3AB9"]
maxTurnsLength = 2;
index = 0

function markLine(id) {
    let gray = "#7f7f7f";
    let line = document.getElementById(id);
    if (line.getAttribute("stroke") == gray) {
        line.setAttribute("stroke", turns[index])
        line.style.opacity = 1;
        checkSquare(id);
    }
}

function nextTurn() {
    index++;
    if (index == maxTurnsLength)
        index = 0;
}

function checkSquare(id) {
    id = id.substr(1);
    coordinates = id.split("_");
    coords = {
        x1: parseInt(coordinates[0]),
        y1: parseInt(coordinates[1]),
        x2: parseInt(coordinates[2]),
        y2: parseInt(coordinates[3])
    };
    horizontal = coords.y1 == coords.y2;
    let addedSquare = false;
    if (horizontal)
        addedSquare = checkSquareHorizontal(coords)
    else
        addedSquare = checkSquareVertical(coords)
    if (!addedSquare)
        nextTurn();
}

function checkSquareHorizontal(coords) {
    let addedSquare = false
    // if the line isnt the last
    if (coords.y2 != 500) {
        if (checkDownside(coords)) {
            markId = generateMarkId(coords, 50, 50);
            var mark = document.getElementById(markId)
            mark.style.visibility = "visible";
            mark.setAttribute("stroke", turns[index]);
            mark.setAttribute("fill", turns[index]);
            addedSquare = true;
        }
    }
    // if the line isnt the first
    if (coords.y1 != 100) {
        if (checkUpside(coords)) {
            markId = generateMarkId(coords, 50, -50);
            var mark = document.getElementById(markId)
            mark.style.visibility = "visible";
            mark.setAttribute("stroke", turns[index]);
            mark.setAttribute("fill", turns[index]);
            addedSquare = true;
        }
    }
    return addedSquare
}

function checkSquareVertical(coords) {
    let addedSquare = false
    // if the line isnt the last
    if (coords.x2 != 500) {
        if (checkRight(coords)) {
            markId = generateMarkId(coords, 50, 50);
            var mark = document.getElementById(markId)
            mark.style.visibility = "visible";
            mark.setAttribute("stroke", turns[index]);
            mark.setAttribute("fill", turns[index]);
            addedSquare = true;
        }
    }
    // if the line isnt the first
    if (coords.x1 != 100) {
        if (checkLeft(coords)) {
            markId = generateMarkId(coords, -50, 50);
            var mark = document.getElementById(markId)
            mark.style.visibility = "visible";
            mark.setAttribute("stroke", turns[index]);
            mark.setAttribute("fill", turns[index]);
            addedSquare = true;
        }
    }
    return addedSquare
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
    return allNeighborsAreFill(neighbor1, neighbor2, neighbor3)
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
    return allNeighborsAreFill(neighbor1, neighbor2, neighbor3)
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
    return allNeighborsAreFill(neighbor1, neighbor2, neighbor3)
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
    return allNeighborsAreFill(neighbor1, neighbor2, neighbor3)
}

function allNeighborsAreFill(n1, n2, n3) {
    return document.getElementById(n1).style.opacity == 1 &&
        document.getElementById(n2).style.opacity == 1 &&
        document.getElementById(n3).style.opacity == 1
}

function generateMarkId(obj, x, y) {
    mark = {};
    mark.x = obj.x1 + x;
    mark.y = obj.y1 + y;
    return "l" + mark.x + "_" + mark.y;
}

function generateId(obj) {
    return "l" + obj.x1 + "_" + obj.y1 + "_" + obj.x2 + "_" + obj.y2;
}